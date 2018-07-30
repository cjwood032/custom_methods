class Tag <ActiveRecord::Base
	belongs_to :mephod
	has_many :mephods
end