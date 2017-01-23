namespace :db do
	desc "poulate db for expenses"
	task populate: :environment do
		#require 'as-duration'
		Expense.destroy_all
		600.times do
			Expense.create!(
				concept: 			Faker::Commerce.product_name,
				value: 				Faker::Number.between(100, 2500)*100,
				date: 				Faker::Time.between(DateTime.now - 200, DateTime.now),
				category_id: 	Faker::Number.between(1, 8),
				type_id:			Faker::Number.between(1, 4)
				
			)
		end
	end
	
end

