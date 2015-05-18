class CreateWinds < ActiveRecord::Migration
  def change
    create_table :winds do |t|
      t.float :speed
      t.float :maxspeed
      t.float :direction
      t.float :maxdirection

      t.timestamps
    end
  end
end
