class Mephod <ActiveRecord::Base
	belongs_to :user
	has_many :tags
	def slug
		mephodname.downcase.gsub(" ","-")
	end
	
	def self.find_by_slug(slug)
		Mephod.all.find{|m| m.slug == slug}
	end
end