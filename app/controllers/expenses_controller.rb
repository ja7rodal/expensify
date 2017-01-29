class ExpensesController < ApplicationController

	def index
		@expenses = Expense.where('date >= ? AND date <= ?', DateTime.now.beginning_of_month, DateTime.now).order(date: :desc )
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.create(expense_params)
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def update
		@expense = Expense.update(params[:id], expense_params)
	end


	private
	def expense_params
		params.require(:expense).permit(:concept, :value, :date, :type_expense, :category )
	end

end
