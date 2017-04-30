require 'pry'

class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    artist = find_by_name(name)
    if artist.nil?
      artist = Artist.new(name)
      artist.save
    end
    artist
  end

  def print_songs
    @songs.collect do |song|
      puts song.name
    end
  end

end
