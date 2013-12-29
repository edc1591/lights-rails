# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Animation.create(name: 'Color Wipe', animationId: 3, speed: 150, brightness: 255)
Animation.create(name: 'Rainbow', animationId: 2, speed: 180, brightness: 255)
Animation.create(name: 'Rainbow Cycle', animationId: 6, speed: 180, brightness: 255)
Animation.create(name: 'Bounce', animationId: 7, speed: 180, brightness: 255)