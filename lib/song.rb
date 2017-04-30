require 'pry'

class Song

  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.new_by_filename(filename)
    split_filename = filename.split(" - ")
    new_artist = Artist.find_or_create_by_name(split_filename[0])
    new_song = Song.new(split_filename[1])
    new_artist.add_song(new_song)
    new_song.artist = new_artist
    new_song
  end

end
