class AddReadingdataToRainfall < ActiveRecord::Migration
  def change
    add_reference :rainfalls, :readingdata, index: true
  end
end
