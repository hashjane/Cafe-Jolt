class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :orders, column: :tray_id_id
  end
end
