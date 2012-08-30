class Userdatum < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :user
  has_many :pledges
  has_many :projects
  validates :user, :presence => true
end
