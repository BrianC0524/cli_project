require 'net/http'
require 'open-uri'
require 'json'


class CurrencyApi

  URL = "https://poe.ninja/api/data/CurrencyOverview?league=Harvest&type=Currency&language=en"
  @CURRENCY_AND_VALUES = []

  def initialize
    save
  end
  
  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def save
    response_data = JSON.parse(get_response_body)
    @CURRENCY_AND_VALUES = response_data["lines"].map do |lines| 
      Currency.new(lines["currencyTypeName"], lines["receive"]["value"])
    end
  end
  
  def all
    @CURRENCY_AND_VALUES
  end
end