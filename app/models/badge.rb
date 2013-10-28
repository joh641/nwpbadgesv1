class Badge < ActiveRecord::Base
  attr_accessible :name, :image, :description, :claimcode
  has_many :submissions
  
  def self.all_badges
    badges = []
    self.all.each do |badge|
      badges.push(badge.name)
    end
    badges
  end
end
