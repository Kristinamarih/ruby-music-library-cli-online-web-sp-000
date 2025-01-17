class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def songs 
    @songs 
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self 
  end
  
  def genres 
    self.songs.collect{|s| s.genre}.uniq  
  end
  
  def save 
    @@all << self 
  end
  
  def self.destroy_all 
    self.all.clear 
  end
  
  def self.create(name)
    self.new(name).tap do |artist|
      artist.save 
    end
  end
  
end