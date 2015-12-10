class CreateMemberslist < ActiveRecord::Migration
  def change
    create_join_table :meetups, :users, table_name :members_lists do |t|
      t.index :meetup_id
      t.index :user_id
    end
  end
end
