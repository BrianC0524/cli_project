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
    #puts response_data["currencyTypeName"]

    currency_Value = { }

    response_data["lines"].map {|lines| currency_Value["#{lines["currencyTypeName"]}"] = lines["receive"]["value"]}

    currency_Value

  end
  
  # def get_currency_type
  #   response_data = JSON.parse(get_response_body)
  #   currency_type = response_data["lines"].map do |v|
  #     v["currencyTypeName"]
  #     v["receive"]["value"]
  #   end
  #   currency_type
  # end
  
  # def get_chaos_value
  #   response_data = JSON.parse(get_response_body)
  #   chaos_value = response_data["lines"].map do |item|
  #     item["receive"]["value"]
  #   end
  #   chaos_value
  # end
end