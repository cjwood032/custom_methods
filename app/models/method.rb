class Mephod <ActiveRecord::Base
	belongs_to :user
	has_many :tags
	def slug
		name.downcase.gsub(" ","-")
	end
	
	def self.find_by_slug(slug)
		Mephod.all.find{|m| m.slug == slug}
	end
end