class MembersList < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user

  validates :user_id, presence: true, uniqueness: {scope: :meetup_id}
  validates :meetup_id, presence: true
end
