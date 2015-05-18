class AddReadingdataToTemperature < ActiveRecord::Migration
  def change
    add_reference :temperatures, :readingdata, index: true
  end
end
