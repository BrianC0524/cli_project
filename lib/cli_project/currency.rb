require './lib/cli_project/CurrencyApi.rb'

class Currency
  attr_reader :name, :value
  
  def initialize(name, value)
    @name = name
    @value = value
    save
    save_names
    save_values
  end
  
  def save
    @@all << self
  end
  
  def save_names
    @@all << self.names
  end
  
  def save_values
    @@all << self.values
  end
  
  def self.all
    @@all
  end
  
  def self.names
    @@names
  end
  
  def self.values
    @@values
  end
end