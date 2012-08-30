module ProjectStatus
  NEW = 0
  ACTIVE = 1
  SUCCESS = 2
  FAILED = 3
  CLOSED = 4
end

class Project < ActiveRecord::Base
  include ProjectStatus
  attr_accessible :desc, :image, :name, :objective, :private, :status

  belongs_to :userdatum
  has_many :pledge_types
  has_many :goals

  validates :desc, :presence => true, :length => { :maximum => 10000 }
  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 1024 }, :uniqueness => true
  validates :status, :presence => true, :numericality => { :only_integer => true, :less_than_or_equal_to => CLOSED, :greater_than_or_equal_to => NEW } 
  validates :image, :length => { :maximum => 1024 }
  validates :objective, :presence => true, :length => { :maximum => 10000 }
  validates :userdatum, :presence => true
end
