require 'PledgeValidator'

class Pledge < ActiveRecord::Base
  attr_accessible :amount, :userdata_id, :pledgetype_id

  belongs_to :userdata
  has_one :pledgetype

  validates_with PledgeValidator, :fields => [ :amount ]
end
