# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
badges = [{:name => 'Test Badge 1', :image => 'test-badge.png', :description => 'Test Badge 1'},
          {:name => 'Advocate Badge', :image => 'advocate-badge.png', :description => 'Advocate Badge', :claimcode => 'advocate'}
	  {:name => 'Facilitator Badge', :image => 'facilitator-badge.png', :description => 'Facilitator Badge', :claimcode => 'facilitator'}]

badges.each do |badge|
  Badge.create! (badge)
end
