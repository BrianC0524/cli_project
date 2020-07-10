require './lib/cli_project/CurrencyApi.rb'

class Currency
  attr_reader :currency_hash, :types, :values
  
  def initialize
    @currency_hash = CurrencyApi.all
    @types = @currency_hash.keys
    @values = @currency_hash.values
  end
  
end