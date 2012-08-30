class Goal < ActiveRecord::Base
  attr_accessible :total, :instances, :project_id, :pledgetype_id

  belongs_to :project
  has_one :pledgetype

  validates :total, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :instances, :numericality => { :greater_than_or_equal_to => 0 }
end
