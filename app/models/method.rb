class Method <ActiveRecord::Base
	belongs_to :user
	def slug
		method.downcase.gsub(" ","-")
	end
	
	def self.find_by_slug(slug)
		Methods.all.find{|m| m.slug == slug}
	end
end