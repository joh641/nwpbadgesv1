class Badge < ActiveRecord::Base
  attr_accessible :name, :image, :description, :claimcode
  validates :name, :presence => true
  validates :image, :presence => true
  validates :description, :presence => true
end
