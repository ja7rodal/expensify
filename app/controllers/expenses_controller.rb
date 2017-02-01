class ExpensesController < ApplicationController

	def index

		@date =  params[:month].present? && params[:year].present? ? Date.new(params[:year].to_i, params[:month].to_i, 1) : Date.today.beginning_of_month
		
		@tipo = params[:tipo]
		@cat = params[:category]
		#cookies[:month] = params[:month].present? ? params[:month] : @date.strftime("%B")
		#cookies[:year] = params[:year].present? ? params[:year] :  @date.strftime("%y")

		@expenses = Expense.months(@date).order(date: :desc )
		@expenses = @expenses.tipo(params[:tipo]) if params[:tipo].present?
		@expenses = @expenses.category(params[:category]) if params[:category].present?

		@categories = Category.all

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
