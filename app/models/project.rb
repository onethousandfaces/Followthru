class Project < ActiveRecord::Base
  attr_accessible :desc, :image, :name, :userdata_id

  belongs_to :userdata
  has_many :pledgetypes
  has_many :goals

  validates :desc, :presence => true, :length => { :maximum => 10000 }
  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 1024 }, :uniqueness => true
  validates :image, :length => { :maximum => 1024 }
end
