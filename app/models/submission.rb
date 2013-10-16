class Submission < ActiveRecord::Base
  attr_accessible :name, :email, :badge, :status, :date, :description
#  validates :name, :presence => true
#  validates :email, :presence => true
#  validates :badge, :inclusion => {:in => Submission.all_badges}
#  validates :status, :inclusion => {:in => Submission.all_statuses}
#  validates :date, :presence => true
#  validates :description, :presence => true
  def self.all_badges
    badges = []
    Badge.all.each do |badge|
      badges.push(badge.name)
    end
    badges
  end
  def self.all_statuses
    %w[Approved Pending Rejected]
  end
end
