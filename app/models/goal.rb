class Goal < ActiveRecord::Base
  attr_accessible :total, :instances, :project_id, :pledge_type_id

  belongs_to :userdatum
  belongs_to :project
  has_one :pledge_type

  validates :total, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :instances, :numericality => { :greater_than_or_equal_to => 0 }
  validates :userdatum, :presence => true
  validates :project, :presence => true
end
