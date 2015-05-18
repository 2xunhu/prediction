class AddReadingdataToWind < ActiveRecord::Migration
  def change
    add_reference :winds, :readingdata, index: true
  end
end
