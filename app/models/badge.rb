class Badge < ActiveRecord::Base
  attr_accessible :name, :image, :description, :claimcode
  has_many :submissions
  has_attached_file :image, :styles => { :medium => "165x165>", :thumb => "100x100>" }, :default_url => "/assets/badges/test-badge.png"
  
  def self.all_badges
    badges = []
    self.all.each do |badge|
      badges.push(badge.name)
    end
    badges
  end
end
