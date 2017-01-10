class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  require 'nokogiri'
  require 'open-uri'
  require 'link_thumbnailer'

  def index
    @posts = Post.all
    @object = LinkThumbnailer.generate('http://www.fashionsnap.com/news/2017-01-05/david-bowie-is-japan/')
  end

  def new
    @thumbnail = ::LinkThumbnailer.generate(params[:url], options)

    render json: @thumbnail, callback: params[:callback]
  rescue ::URI::InvalidURIError, ::Net::HTTPServerException => e
    render json: { error: e.message }, callback: params[:callback], status: 422
  rescue ::LinkThumbnailer::Exceptions => e
    render json: { error: e.message }, callback: params[:callback], status: 400
  end

  def search(text)
    url = text
    charset = nil

    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    hoge = doc.css('img').map { |img| img.attr('src') }

    post = Post.new(title: doc.title, body: hoge[3])
    post.save
    redirect_to :back
  end

  def show
  end


  def edit
  end


  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def options
    ::OptionsParser.new(params.fetch(:options, {})).call
  end

  def permitted_params
    params.require(:url)
    params.permit(options: [])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :published_on)
  end
end
