class ChangeDateTypeFormatInNote < ActiveRecord::Migration
  def change
  	change_column :notes, :category, :text
  end
end
