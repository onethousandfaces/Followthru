class Project < ActiveRecord::Base
  attr_accessible :desc, :image, :name

  belongs_to :userdatum
  has_many :pledge_types
  has_many :goals

  validates :desc, :presence => true, :length => { :maximum => 10000 }
  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 1024 }, :uniqueness => true
  validates :image, :length => { :maximum => 1024 }
  validates :userdatum, :presence => true
end
