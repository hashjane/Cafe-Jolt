class AddForeignKeyTable < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :orders, :trays
  end
end
