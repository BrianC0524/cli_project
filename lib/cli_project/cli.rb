require './lib/cli_project/CurrencyApi.rb'
require './lib/cli_project/currency.rb'

class CliProject::CLI
  attr_reader :currency
  
  
  def initialize
    @currency = Currency.all
  end
  
  def call
    CurrencyApi.new
    puts "Welcome to POExchange"
    puts "Loading Currency from poe.ninja..."
    #sleep(5)
    puts Currency.list_currency
    puts "----------------------------------------------------------------"
    puts "Please enter a number (1-#{@currency.count}) of the currency you wish to view."
    userInput
  end
  
  def userInput
    input = nil
    while input != "exit"
      input = gets.downcase.strip
      index = input.to_i
      if index > 0 && index <= @currency.length && @currency[index - 1].value.to_i > 1
        puts "#{@currency[index - 1].name} is currently worth #{@currency[index - 1].value.to_i} chaos!"
      elsif index > 0 && index <= @currency.length && @currency[index - 1].value.to_i < 1
        puts "#{@currency[index - 1].name} is currently worth less than 1 chaos!"
      elsif input == "exit"
        shutdown
      else
        puts "Invalid input!"
      end
    end
  end
  
  def shutdown
    puts "Thank you for using POExchange!"
    puts "Shutting down..."
  end
end