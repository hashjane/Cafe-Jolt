module ButtonsHelper
  def get_line_item_id menu_item_id
    item = Array.new
    item = @tray.line_items.where( menu_item_id: menu_item_id, tray_id: @tray.id)
    item.ids
  end
end
