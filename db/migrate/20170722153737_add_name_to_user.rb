class AddNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :introduction, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :address, :string
    add_column :users, :affiliation, :string
  end
end
