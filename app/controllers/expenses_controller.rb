class ExpensesController < ApplicationController
  def index
    @expenses = Expense.take(30)
  end
end
