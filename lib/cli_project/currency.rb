require './lib/cli_project/CurrencyApi.rb'

class Currency
  attr_reader :name, :value
  @@all = []
  @@names = []
  @@values = []
  
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
    @@names << self.name
  end
  
  def save_values
    @@values << self.value
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
  
  def self.list_currency
    @@all.map.with_index do |item, index|
      "#{index+1}. #{item.name}"
    end
  end
end