namespace :db do 
  desc "Clear the DB and fill with excellent sample data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    #clear out old junk
    [Artist, Song].each(&:destroy_all)

    # Add fake data to those tables
    Genre.all.each do |genre|
      #create artist inside that genre
      Artist.populate 5..10 do |artist|

        #set the artist name and genre id
        artist.name = Faker::Name.first_name
        artist.genre_id = genre.id

        Song.populate 5..10 do |song|
          #set the name and artist id
          song.name = Faker::Company.catch_phrase
          song.artist_id = artist.id

        end
      end
    end

    puts "Booya!  Done populating."
  end
end