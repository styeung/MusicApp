# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bands = Band.create!([
  {name: "Oasis"},
  {name: "Pearl Jam"},
  {name: "Nirvana"},
  ])

albums = Album.create!([
  {name: "Definitely Maybe", band_id: 1, environment: "studio"},
  {name: "What's the Story (Morning Glory)", band_id: 1, environment: "studio"},
  {name: "Be Here Now", band_id: 1, environment: "studio"}
  ])

tracks = Track.create!([
  {name: "Wonderwall", album_id: 2, edition: "regular"},
  {name: "Supersonic", album_id: 1, edition: "regular"},
  {name: "Don't Go Away", album_id: 3, edition: "regular"},
  ])