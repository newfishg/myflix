# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = Category.create([{ name: 'TV Commedies' }, { name: 'TV Dramas' }, { name: 'Reality TV'}])
Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)
Video.create(title: 'GOT', description: 'Snow and Fire', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.second)
Video.create(title: 'SuperModel', description: 'top model selection', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories[2])
Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)
Video.create(title: 'GOT', description: 'Snow and Fire', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.second)
Video.create(title: 'SuperModel', description: 'top model selection', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories[2])
Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)
Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)
Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)
Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)
monk = Video.create(title: 'South Park', description: 'four people and some things', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/monk_large.jpg', category: categories.first)

david = User.create(full_name: "David Chen", password: "password", email: "david@example.com")
ken = User.create(full_name: "Ken Chen", password: "password", email: "ken@example.com")

Review.create(user: david, video: monk, rating: 5, content: "This is a funny video!")
Review.create(user: david, video: monk, rating: 3, content: "This is not a funny video!")