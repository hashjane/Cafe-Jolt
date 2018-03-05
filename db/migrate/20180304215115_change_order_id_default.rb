class ChangeOrderIdDefault < ActiveRecord::Migration[5.1]
  def up
    change_column :orders, :id, :text, :default => `hex(randomblob(16))`
  end

  def down
    change_column :orders, :id, :text, :default => "hex(randomblob(4))"
  end
end
