class AddMeetupValidations < ActiveRecord::Migration
  def up
    change_column :meetups, :name, :string, null: false
    change_column :meetups, :name, :string, unique: true
    change_column :meetups, :creator, :string, null: false
    change_column :meetups, :description, :text, null: false
    change_column :meetups, :location, :string, null: false
  end
  def down
    change_column :meetups, :name, :string
    change_column :meetups, :creator, :string
    change_column :meetups, :description, :text
    change_column :meetups, :location, :string 
  end
end
