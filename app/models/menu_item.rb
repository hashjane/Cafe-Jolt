class MenuItem < ApplicationRecord
  require 'faraday'

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  API_BASE_URL = "https://kitchen-service.herokuapp.com"


  def self.connect_to_api
    conn = Faraday.new(:url => "#{API_BASE_URL}") do |faraday|
      faraday.request   :url_encoded
      faraday.response  :logger
      faraday.adapter   Faraday.default_adapter
    end
  end

  def self.get_menu_items
    conn = self.connect_to_api
    menu_items  = conn.get 'menu_items'
    @menu_items = JSON.parse(menu_items.body, symbolize: true)
  end

  def self.get_menu_item_by_id(id)
    conn = self.connect_to_api
    menu_item_by_id = conn.get "#{id}"
    @menu_item_by_id = JSON.parse(menu_item_by_id.body, symbolize: true)
  end

  def self.get_menu_items_by_tray(items_in_tray)
    items_in_tray.map do |item|
      get_menu_item_by_id(item[:menu_item_id]).merge!({quantity: "#{item[:quantity]}"})
    end
  end

  private

    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end

end
