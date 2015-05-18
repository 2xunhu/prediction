class CreatePredictiondata < ActiveRecord::Migration
  def change
    create_table :predictiondata do |t|
      t.float :temp
      t.float :rainfall
      t.float :winddir
      t.float :windspeed
      t.datetime :datetime

      t.timestamps
    end
  end
end
