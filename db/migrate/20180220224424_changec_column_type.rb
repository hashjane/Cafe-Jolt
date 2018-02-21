class ChangecColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column       :line_items, :menu_item_id, :text
    remove_foreign_key  :line_items, column: :menu_item_id
  end
end
