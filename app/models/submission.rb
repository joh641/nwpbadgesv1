class Submission < ActiveRecord::Base
  attr_accessible :name, :badge, :status, :date, :description
  def self.all_badges
    ['Test Badge 1', 'Test Badge 2']
  end
end
