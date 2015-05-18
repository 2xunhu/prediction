class AddStationToReadingdata < ActiveRecord::Migration
  def change
    add_reference :readingdata, :station, index: true
  end
end
