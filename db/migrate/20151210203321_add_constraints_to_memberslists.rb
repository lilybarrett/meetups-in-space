class AddConstraintsToMemberslists < ActiveRecord::Migration
  def up
    add_index :members_lists, [:user_id, :meetup_id], unique: true
  end
  def down
    remove_index :members_lists, [:user_id, :meetup_id], unique: true
  end
end
