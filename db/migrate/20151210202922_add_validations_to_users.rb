class AddValidationsToUsers < ActiveRecord::Migration
  def up
    change_column :users, :provider, :string, null: false
    change_column :users, :uid, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :username, :string, null: false
    change_column :users, :avatar_url, :string, null: false
  end
  def down
    change_column :users, :provider, :string
    change_column :users, :uid, :string
    change_column :users, :email, :string 
    change_column :users, :username, :string
    change_column :users, :avatar_url, :string
  end
end
