class Project < ActiveRecord::Base
  attr_accessible :desc, :image, :name, :userdata_id
end
