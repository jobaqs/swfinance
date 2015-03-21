class AccountsController < ApplicationController
  layout 'home'
#  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @accounts = Account.order('account_number')
    respond_with(@accounts)
  end

  def show
    respond_with(@account)
  end

  def new
    @account = current_user.accounts.new
    respond_with(@account)
  end

  def edit
  end

  def create
    @account = current_user.accounts.new(account_params)
    @account.save
    redirect_to accounts_url
  end

  def update
    @account.update(account_params)
    respond_with(@account)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:account_number, :account_name, :user_id)
    end
end
