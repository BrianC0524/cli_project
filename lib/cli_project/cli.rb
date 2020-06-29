require './lib/cli_project/CurrencyApi.rb'

class CliProject::CLI
  attr_reader :currency_list, :chaos_value
  
  def initialize
    
    @currency_list = CurrencyApi.new.get_currency_type
    @chaos_value = CurrencyApi.new.get_chaos_value
    
  end
  
  def call
    list_currency
    menu
    shutdown
  end
  
  def list_currency
    @currency_list.each_with_index do |item, index|
      puts "#{index+1}. #{item}"
    end
  end
  
  def menu
    #puts "\nEnter the number of the Currency you wish to view:"
    input = nil
    while input != "exit"
      input = gets.strip
      index = input.to_i
      if index > 0 && index <= @currency_list.length
        puts "#{@currency_list[input.to_i - 1]} is currently worth #{@chaos_value[input.to_i - 1].to_i} chaos!"
      else
        puts "Invalid input!"
      end
    end
  end
  
  def shutdown
    puts "Shutting down..."
  end
end