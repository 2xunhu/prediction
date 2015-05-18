class AddPostcodeToPredictiondata < ActiveRecord::Migration
  def change
    add_reference :predictiondata, :postcode, index: true
  end
end
