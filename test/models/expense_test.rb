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

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
