class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :tray, foreign_key: true
      t.text :components

      t.timestamps
    end
  end
end
