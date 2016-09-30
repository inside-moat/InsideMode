require 'themoviedb'

Tmdb::Api.key("b01f103000a7352c4b22fe61eebfd2ec")
Tmdb::Api.language("ja")
puts "api connect"

now_play = Tmdb::Movie.now_playing
puts now_play.class
puts now_play.methods
now_play.each do |now|
  puts now.title
  puts now.release_date
  puts now.runtime
end
