class PledgeType < ActiveRecord::Base
  attr_accessible :desc, :image, :name, :amount, :project_id

  belongs_to :project
  belongs_to :userdatum

  validates :amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :desc, :presence => true, :length => { :maximum => 10000 }
  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 1024 }, :uniqueness => true
  validates :image, :length => { :maximum => 1024 }
  validates :userdatum, :presence => true
  validates :project, :presence => true
end
