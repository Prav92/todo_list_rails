class CreateNotesTags < ActiveRecord::Migration
  def change
    create_table :notes_tags do |t|
      t.references :note, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
