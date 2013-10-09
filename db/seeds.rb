# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

submissions = [{:name => 'Test User', :badge => 'Test Badge 1', :status => 'Approved', :date => '8-Oct-2013', :description => 'Insert Description Here'}]



submissions.each do |submission|
  Submission.create! (submission)
end
