class Readingdata < ActiveRecord::Base
        has_one :wind
		has_one :rainfall
		has_one :temperature
		belongs_to :station
end
