class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :temp
      t.float :maxtemp

      t.timestamps
    end
  end
end
