require 'themoviedb'

Tmdb::Api.key("b01f103000a7352c4b22fe61eebfd2ec")
Tmdb::Api.language("ja")
puts "api connect"

now_play = Tmdb::Movie.now_playing
now_play.each do |now|
  ::InsideMoatDevelopment::Movies.find_or_create_by(
    title: now.title,
    runtime: now.runtime
   )
end
