class Pledge < ActiveRecord::Base
  attr_accessible :amount, :pledgetype_id, :userdata_id
end
