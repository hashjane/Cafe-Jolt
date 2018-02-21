json.extract! line_item, :id, :menu_item_id, :tray_id, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
