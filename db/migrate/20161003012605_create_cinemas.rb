class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.text :title
      t.datetime :runtime

      t.timestamps null: false
    end
  end
end
