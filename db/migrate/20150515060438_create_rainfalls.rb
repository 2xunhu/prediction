class CreateRainfalls < ActiveRecord::Migration
  def change
    create_table :rainfalls do |t|
      t.float :amount

      t.timestamps
    end
  end
end
