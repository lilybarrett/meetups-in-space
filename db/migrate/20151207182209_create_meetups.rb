class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :creator
      t.string :members_list
    end
  end
end
