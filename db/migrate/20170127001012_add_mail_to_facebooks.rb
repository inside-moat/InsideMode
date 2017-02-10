class AddMailToFacebooks < ActiveRecord::Migration
  def change
    add_column :facebooks, :mail, :string, :after => :id 
  end
end
