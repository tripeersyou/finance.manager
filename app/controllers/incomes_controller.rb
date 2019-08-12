class IncomesController < ApplicationController
    before_action :set_account
    before_action :set_income, only: [:edit, :update]

    def new
        @income = @account.incomes.new
    end

    def create
        @income = @account.incomes.new(income_params)
        if @income.save
            @account.balance = @account.balance + @income.amount
            @account.save
            redirect_to account_path(@account)
        else
            render :new
        end
    end

    def edit

    end

    def update
        initial_amount = @income.amount
        @income.assign_attributes (income_params)
        new_amount = @income.amount
        diff_amount = initial_amount - new_amount
        if @income.update(income_params)
            @account.balance = @account.balance - diff_amount
            @account.save
            redirect_to account_path(@account)
        else
            render :new
        end
    end

    private
        def income_params
            params.require(:income).permit!
        end 
        def set_account
            @account = Account.find(params[:account_id])
        end

        def set_income
            @income = Income.find(params[:id])
        end
end
