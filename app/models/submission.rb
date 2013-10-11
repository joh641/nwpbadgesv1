class Submission < ActiveRecord::Base
  attr_accessible :name, :email, :badge, :status, :date, :description
  def self.all_badges
    badges = []
    Badge.all.each do |badge|
      badges.push(badge.name)
    end
    badges
  end
end
