class TransfersController < ApplicationController
    before_action :set_account

    def new
        if @account.balance > 0
            @expense = @account.expenses.new
        else
            redirect_to account_path(@account)
        end
    end
    def create
        @receipient = Account.find(params[:receipient])
        @expense = @account.expenses.new(expense_params)
        @income = @receipient.incomes.new(expense_params)
        @expense.description = "Sent money to #{@receipient.name} via transfer."
        @income.description = "Received money from #{@account.name} via transfer."
        if @account.balance - @expense.amount > 0
            if @expense.save
                @account.balance = @account.balance - @expense.amount
                @account.save
                @receipient.balance = @receipient.balance + @expense.amount
                @receipient.save
                redirect_to account_path(@account)
            else
                render :new
            end
        else 
            redirect_to account_path(@account) 
        end
    end
    
    private
        def set_account
            @account = Account.find(params[:account_id])
        end
        def expense_params
            params.require(:expense).permit!
        end
end
