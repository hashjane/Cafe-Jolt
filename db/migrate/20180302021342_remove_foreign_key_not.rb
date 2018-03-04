class RemoveForeignKeyNot < ActiveRecord::Migration[5.1]
  def up
    remove_foreign_key :orders, column: :tray_id
  end
end
