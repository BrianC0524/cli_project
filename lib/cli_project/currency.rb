require './lib/cli_project/CurrencyApi.rb'

class Currency
  attr_reader :currency_hash, :types, :values
  
  def initialize
    @currency_hash = CurrencyApi.new.get_currency_type_and_value
    @types = @currency_hash.keys
    @values = @currency_hash.values
  end
  
end