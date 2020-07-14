require './lib/cli_project/CurrencyApi.rb'

class Currency
  attr_reader :name, :value
  @@all = []
  
  def initialize(name, value)
    @name = name
    @value = value
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.list_currency
    @@all.map.with_index do |item, index|
      "#{index+1}. #{item.name}"
    end
  end
end