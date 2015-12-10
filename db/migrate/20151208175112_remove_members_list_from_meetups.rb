class RemoveMembersListFromMeetups < ActiveRecord::Migration
  def change
    remove_column :meetups, :members_list, :string
  end
end
