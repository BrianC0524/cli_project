require './lib/cli_project/CurrencyApi.rb'
require './lib/cli_project/currency.rb'

class CliProject::CLI
  attr_reader :currency_list, :currency_values, :currency
  
  
  def initialize
    @currency = Currency.all
    @currency_list = Currency.names
    @currency_values = Currency.values
  end
  
  def call
    CurrencyApi.new
    puts "Welcome to POExchange"
    puts "Loading Currency from poe.ninja..."
    #sleep(5)
    puts Currency.list_currency
    puts "----------------------------------------------------------------"
    puts "Please enter a number (1-#{@currency_list.count}) of the currency you wish to view."
    userInput
  end
  
  # def list_currency
  #   @currency.each_with_index do |item, index|
  #     puts "#{index+1}. #{item.name}"
  #   end
  # end
  
  def userInput
    input = nil
    while input != "exit"
      input = gets.downcase.strip
      index = input.to_i
      if index > 0 && index <= @currency_list.length && @currency_values[input.to_i - 1].to_i > 1
        puts "#{@currency_list[input.to_i - 1]} is currently worth #{@currency_values[input.to_i - 1].to_i} chaos!"
      elsif index > 0 && index <= @currency_list.length && @currency_values[input.to_i - 1].to_i < 1
        puts "#{@currency_list[input.to_i - 1]} is currently worth less than 1 chaos!"
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