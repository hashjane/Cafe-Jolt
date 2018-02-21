class Tray < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_menu_item(menu_item)
    current_item = line_items.find_by(menu_item_id: menu_item['_links']['self']['href'])
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(menu_item_id: menu_item['_links']['self']['href'])
    end
    current_item
  end
end
