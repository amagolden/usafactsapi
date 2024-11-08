class ExpenseController < ApplicationController
    def index
      @expense = expense.all
      render json: @expense
    end
  
    def create
      @expense = Expense.new(expense_params)
      
      if @expense.save
        render json: @expense, status: :created
      else
        render json: {error: 'Expense creation failed'}, status: :unprocessable_entity
      end
    end
  
    def show
      @expense = Expense.find(params[:id])
  
      if @expense
        render json: @expense, status: :ok
      else
        render json: { error: 'Expense not found' }, status: :not_found
      end
    end
  
    def update
      @expense = Expense.find(params[:id])
  
      if @expense.update(expense_params)
        render json: @expense, status: :ok
      else
        render json: { error: 'Expense update failed' }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @expense = Expense.find(params[:id])
  
      if @expense.destroy
        render json: { message: 'Expense successfully deleted' }, status: :ok
      else
        render json: { error: 'Expense deletion failed' }, status: :internal_server_error
      end
    end
  
    private
  
    def expense_params
      params.permit(:name, :cost, :year)
    end
  
  end
end
