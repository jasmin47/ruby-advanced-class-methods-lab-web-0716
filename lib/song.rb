class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song_object| song_object.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name) == false
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  def self.alphabetical
  @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    song = self.new
    song.artist_name = name.split(/ \-\ |.mp3/)[0]
    song.name = name.split(/ \-\ |.mp3/)[1]
    @@all << song
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.artist_name = name.split(/ \-\ |.mp3/)[0]
    song.name = name.split(/ \-\ |.mp3/)[1]
    @@all << song
    song
  end



  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
