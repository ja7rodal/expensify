class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
		rename_column :expenses, :type_id, :type_expense
	end
end
