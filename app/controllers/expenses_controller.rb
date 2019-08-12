class ExpensesController < ApplicationController
    before_action :set_account
    before_action :set_expense, only: [:edit, :update]

    def new
        if @account.balance > 0
            @expense = @account.expenses.new
        else
            redirect_to account_path(@account)
        end
    end

    def create
        @expense = @account.expenses.new(expense_params)
        if @account.balance - @expense.amount > 0
            if @expense.save
                @account.balance = @account.balance - @expense.amount
                @account.save
                redirect_to account_path(@account)
            else
                render :new
            end
        else 
            redirect_to account_path(@account) 
        end
    end

    def edit

    end

    def update
        initial_amount = @expense.amount
        @expense.assign_attributes (expense_params)
        new_amount = @expense.amount
        diff_amount = initial_amount - new_amount
        if @account.balance + diff_amount > 0
            if @expense.update(expense_params)
                @account.balance = @account.balance + diff_amount
                @account.save
                redirect_to account_path(@account)
            else
                render :new
            end
        else 
            redirect_to account_path(@account) 
        end
    end

    private
        def expense_params
            params.require(:expense).permit!
        end 
        def set_account
            @account = Account.find(params[:account_id])
        end

        def set_expense
            @expense = Expense.find(params[:id])
        end
end
