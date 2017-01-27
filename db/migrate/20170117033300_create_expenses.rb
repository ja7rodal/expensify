class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.decimal :value
      t.date :date
			t.integer :type_id
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
