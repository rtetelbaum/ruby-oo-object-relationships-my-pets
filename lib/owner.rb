class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 

  def self.count
    @@all.count 
  end

  def self.reset_all
    @@all = []
  end 

  def cats
    Cat.all.find_all { |cats| cats.owner == self }
  end

  def dogs
    Dog.all.find_all { |dogs| dogs.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end 

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end 

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy"}
  end 

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy"}
  end 

  def sell_pets
    self.cats.each do |cat| 
    cat.mood = "nervous"
    cat.owner = nil
    end

    self.dogs.each do |dog|
    dog.mood = "nervous"
    dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end