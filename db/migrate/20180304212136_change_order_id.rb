class ChangeOrderId < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :id, :text, :default => "hex(randomblob(4))"
  end
end
