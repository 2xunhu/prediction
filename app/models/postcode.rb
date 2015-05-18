class Postcode < ActiveRecord::Base
	has_and_belongs_to_many :stations
	has_many :predictiondatas
end
