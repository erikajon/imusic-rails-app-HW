# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Artist.delete_all
Song.delete_all
Album.delete_all
AlbumSong.delete_all

# Creating artists
a1 = Artist.create(name: 'Tyler Swift')
a2 = Artist.create(name: 'Kylie Minogue')
a3 = Artist.create(name: 'Sean Paul')
a4 = Artist.create(name: 'Whiz Khalifa')
a5 = Artist.create(name: 'Britney Spears')
a6 = Artist.create(name: 'Florence and the Machine')

# Create albums
20.times do |a|
  a += 1
  Album.create(name: "I am album number #{a}")
end

# Creating songs and assigning them to artists
100.times do |s|
  s += 1
  Song.create(title: "I am song number #{s}", duration: '3 min 2 s')
end

Song.all.each do |song|
  song.artist_id = Artist.all.sample
  song.save
end

# Putting songs into albums
Song.all.each do |song|
  album_id = Album.all.sample.id
  song.album_songs.create(album_id: album_id)
end

puts 'Seeding done'

