class CombineItemsInTray < ActiveRecord::Migration[5.1]
  def up
    Tray.all.each do |tray|
      sums = tray.line_items.group(:menu_item_id).sum(:quantity)

      sums.each do |menu_item_id, quantity|
        if quantity > 1
          tray.line_items.where(menu_item_id: menu_item_id).delete_all

          item = tray.line_items.build(menu_item_id: menu_item_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
