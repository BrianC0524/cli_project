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
  
  def parse_json
    response_data = JSON.parse(get_response_body)

    currency_collection = response_data["lines"].map.with_index do |v, i|
      "#{i+1}. #{v["currencyTypeName"]}"
    end
    
    currency_collection
  end
  
  
end