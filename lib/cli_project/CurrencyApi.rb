require 'net/http'
require 'open-uri'
require 'json'


class CurrencyApi
  
  URL = "https://poe.ninja/api/data/CurrencyOverview?league=Harvest&type=Currency&language=en"
  
  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def get_currency_type_and_value
    response_data = JSON.parse(get_response_body)
    currency_Value = { }
    response_data["lines"].map {|lines| currency_Value["#{lines["currencyTypeName"]}"] = lines["receive"]["value"]}
    currency_Value
  end
end