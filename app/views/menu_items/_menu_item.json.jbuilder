json.extract! menu_item, :id, :id, :kind, :name, :description, :stock_level, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
