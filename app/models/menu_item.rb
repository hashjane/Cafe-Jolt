class MenuItem < ApplicationRecord
  require 'faraday'

  API_BASE_URL = "https://kitchen-service.herokuapp.com"

  def self.connect_to_api
    user = Faraday.get "#{API_BASE_URL}/menu_items"
    @data = JSON.parse(user.body, symbolize: true)
  end
end
