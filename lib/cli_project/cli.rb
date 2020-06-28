require './lib/cli_project/CurrencyApi.rb'

class CliProject::CLI
  
  def call
    puts "Current Exchange Rates. Which would you like to view?"
    list
  end
  
  def list
    list = CurrencyApi.new.parse_json
    puts list
  end
end