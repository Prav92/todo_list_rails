class Note < ActiveRecord::Base
	has_and_belongs_to_many :tags, :dependent => :destroy
	
	after_create do 
		note = Note.find_by(id: self.id)
		hashtags = self.category.scan(/#\w+/)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			note.tags << tag
		end
	end

	before_update do
		note = Note.find_by(id: self.id)
		note.tags.clear
		hashtags = self.category.scan(/#\w+/)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			note.tags << tag
		end
	end
end
