class CreateReadingdata < ActiveRecord::Migration
  def change
    create_table :readingdata do |t|
      t.datetime :datetime

      t.timestamps
    end
  end
end
