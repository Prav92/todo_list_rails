class NoteController < ApplicationController

	def index
		@notes = Note.all
		@note = Note.new
		@tags = Tag.all.order('name')
		# Tag.all.order('name').first.name.chars.first.upcase
	end

	def new
	end

	def create
		@note = Note.new(note_params)
		@note.save
		redirect_to note_index_path
	end

	def hashtags
		tag = Tag.find_by(name: params[:name])
		@notes = tag.notes
	end





private
	
	def note_params
		params.require(:note).permit(:notes, :category)
	end


end
