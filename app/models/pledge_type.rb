class PledgeType < ActiveRecord::Base
  attr_accessible :desc, :image, :name, :project_id

  belongs_to :project

  validates :desc, :presence => true, :length => { :maximum => 10000 }
  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 1024 }, :uniqueness => true
  validates :image, :length => { :maximum => 1024 }
end
