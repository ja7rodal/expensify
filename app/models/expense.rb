# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  concept      :string
#  value        :decimal(, )
#  date         :date
#  type_expense :integer
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Expense < ApplicationRecord
	belongs_to :category

	validates :concept, presence: true
	validates :value, presence: true
	validates :date, presence: true

	enum type_expense: [:Purchase, :Withdrawal, :Transfer, :Payment]
	#default_scope { where('date >= ? ', Time.now.strftime('%Y-%m-01'))  }
	scope :months, -> (dateb, datef) { where("date >= ? AND date < ? ", dateb , datef)}

end
