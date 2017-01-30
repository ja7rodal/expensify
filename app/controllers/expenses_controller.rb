class ExpensesController < ApplicationController

	def index
		@expenses = Expense.where('date >= ? and date < ?', (Time.now-1.month).strftime("%Y-%m-01"), (Time.now+0.month).strftime("%Y-%m-01") ).order(date: :desc )
		
		@transactions = @expenses.count
		@average = @expenses.average(:value)
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
