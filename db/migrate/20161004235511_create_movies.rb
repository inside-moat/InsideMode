class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :title
      t.datetime :runtime

      t.timestamps null: false
    end
  end
end
