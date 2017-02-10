class ChangeColumnToFacebooks < ActiveRecord::Migration
	def up
    change_column :facebooks, :mail, :string, :after => :id
    change_column :facebooks, :password, :string, :after => :mail
  end
end
