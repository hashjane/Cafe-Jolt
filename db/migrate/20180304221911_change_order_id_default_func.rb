class ChangeOrderIdDefaultFunc < ActiveRecord::Migration[5.1]
  def change
    change_column_default :orders, :id, nil
  end
end
