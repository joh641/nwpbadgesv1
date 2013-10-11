class Badge < ActiveRecord::Base
  attr_accessible :name, :image, :description, :claimcode
end
