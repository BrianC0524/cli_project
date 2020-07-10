require './lib/cli_project/CurrencyApi.rb'
require './lib/cli_project/currency.rb'

class CliProject::CLI
  attr_reader :currency_list, :chaos_value
  
  
  def initialize
    @currency_list = Currency.new
  end
  
  def call
    puts "Welcome to POExchange"
    puts "Loading Currency from poe.ninja..."
    sleep(15)
    list_currency
    puts "----------------------------------------------------------------"
    puts "Please enter a number (1-#{@currency_list.types.count}) of the currency you wish to view."
    menu
  end
  
  def list_currency
    @currency_list.types.each_with_index do |item, index|
      puts "#{index+1}. #{item}"
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      input = gets.downcase.strip
      index = input.to_i
      if index > 0 && index <= @currency_list.types.length && @currency_list.values[input.to_i - 1].to_i > 1
        puts "#{@currency_list.types[input.to_i - 1]} is currently worth #{@currency_list.values[input.to_i - 1].to_i} chaos!"
      elsif index > 0 && index <= @currency_list.types.length && @currency_list.values[input.to_i - 1].to_i < 1
        puts "#{@currency_list.types[input.to_i - 1]} is currently worth less than 1 chaos!"
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