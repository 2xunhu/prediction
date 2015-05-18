class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.float :lat
      t.float :lon
      t.string :name

      t.timestamps
    end
  end
end
