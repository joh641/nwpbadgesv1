class Submission < ActiveRecord::Base
  attr_accessible :name, :badge, :date, :description
  def self.all_badges
    ['Test Badge 1', 'Test Badge 2']
  end
end
