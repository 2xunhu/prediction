class Station < ActiveRecord::Base
        has_many :readingdatas
		has_and_belongs_to_many :postcodes
end
