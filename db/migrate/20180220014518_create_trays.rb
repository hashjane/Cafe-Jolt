class CreateTrays < ActiveRecord::Migration[5.1]
  def change
    create_table :trays do |t|

      t.timestamps
    end
  end
end
