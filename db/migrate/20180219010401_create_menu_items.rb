class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.text :menu_item_id
      t.string :kind
      t.string :name
      t.text :description
      t.integer :stock_level

      t.timestamps
    end
  end
end
