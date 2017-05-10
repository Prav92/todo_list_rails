module NoteHelper
	def render_with_hashtags category
		category.gsub(/#\w+/){|word| link_to word, "/note/hashtag/#{word.downcase.delete('#')}"}.html_safe
	end

	
end
