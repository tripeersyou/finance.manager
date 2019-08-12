class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :edit, :update, :destroy]
    
    def index
        @accounts = current_user.accounts.all
    end

    def new
        @account = current_user.accounts.new
    end

    def create
        @account = current_user.accounts.new(account_params)
        if @account.save
            redirect_to accounts_path
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @account.update(account_params)
            redirect_to account_path(@account)
        else
            render :edit
        end
    end

    def destroy
        @account.delete
        redirect_to root_path
    end

    private
        def set_account
            @account = Account.find(params[:id])
        end

        def account_params
            params.require(:account).permit!
        end
end
