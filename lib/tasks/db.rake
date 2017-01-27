namespace :db do
	desc "poulate db for expenses"
	task populate: :environment do
		#require 'as-duration'
		Expense.destroy_all
		600.times do
			tipo = ["Purchase", "Withdrawal", "Transfer", "Payment"]
			Expense.create!(
				concept: 			Faker::Commerce.product_name,
				value: 				Faker::Number.between(100, 2500)*100,
				date: 				Faker::Time.between(DateTime.now - 200, DateTime.now),
				type_expense:	Faker::Number.between(0,3),
				category_id: 	Faker::Number.between(1, 8)


				)
		end
	end

end

