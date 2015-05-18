class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.float :lat
      t.float :lon
      t.integer :postcode

      t.timestamps
    end
  end
end
