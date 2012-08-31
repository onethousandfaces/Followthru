require 'PledgeValidator'

class Pledge < ActiveRecord::Base
  attr_accessible :amount, :userdatum_id, :pledge_type_id

  belongs_to :userdatum
  has_one :pledge_type

  validates :amount, :presence => true
  validates :userdatum, :presence => true
  validates :pledge_type, :presence => true
  #validates_with PledgeValidator, :fields => [ :amount ]
end
