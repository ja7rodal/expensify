class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
		rename_column :expenses, :type_id, :type
		change_column :expenses, :type, :integer
	end
	
end
