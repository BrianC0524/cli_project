require 'net/http'
require 'open-uri'
require 'json'


class CurrencyApi
  
  URL = "https://poe.ninja/api/data/CurrencyOverview?league=Harvest&type=Currency&language=en"
  CURRENCY_AND_VALUES = {}
  
  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def get_currency_type_and_value
    response_data = JSON.parse(get_response_body)
    response_data["lines"].map {|lines| CURRENCY_AND_VALUES["#{lines["currencyTypeName"]}"] = lines["receive"]["value"]}
  end
  
  def self.all
    
    CURRENCY_AND_VALUES
    
  end
end