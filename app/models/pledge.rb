require 'PledgeValidator'

class Pledge < ActiveRecord::Base
  attr_accessible :amount, :userdatum_id

  belongs_to :userdatum
  has_one :pledge_type

  validates_with PledgeValidator, :fields => [ :amount ]
  validates :userdatum, :presence => true
  validates :pledge_type, :presence => true
end
