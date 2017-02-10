class AddPasswordToFacebooks < ActiveRecord::Migration
  def change
    add_column :facebooks, :password, :string
  end
end
