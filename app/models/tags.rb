class Tag <ActiveRecord::Base
	belongs_to :mephods
	has_many :mephods
end