class Meetup < ActiveRecord::Base
  has_many :users, through: :members_lists
  has_many :members_lists

  validates :name, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :description, presence: true
  validates :location, presence: true
end
