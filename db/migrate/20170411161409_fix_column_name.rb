class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :notes, :type, :category
  end
end
