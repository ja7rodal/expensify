class ExpensesController < ApplicationController

	def index
		@expenses = Expense.where('date >= ? AND date <= ?', DateTime.now.beginning_of_month, DateTime.now).order(date: :desc )
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.create(expense_params)
		if @expense.save
			redirect_to expenses_path, notice: "Expense successfully published"
		else
			render :new
		end
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def update
		@expense = Expense.find(params[:id])
		if @expense.update(expense_params)
			redirect_to expenses_path, notice: "Current Expense"
		else
			render :edit
		end
	end

	def destroy
		expense = Expense.find(params[:id])
		expense.destroy

		redirect_to expenses_path, notice: "Expense delete successfully"
	end

	private
	def expense_params
		params.require(:expense).permit(:concept, :value, :date, :type_expense, :category_id )
	end

end
