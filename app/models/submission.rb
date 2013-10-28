class Submission < ActiveRecord::Base
  attr_accessible :name, :email, :description
  belongs_to :badge
  def self.all_statuses
    %w[Approved Pending Rejected]
  end
end
