class FacebookAccounts < ApplicationController
  before_action :require_account_logged_in!
  before_action :set_facebook_account, only: [:destroy]

  def index
    @facebook_accounts = Current.account.facebook_accounts
  end

  def destroy
    @facebook_account = Current.account.facebook_accounts.find(params[:id])
    @facebook_account.destroy
    redirect_to facebook_accounts_path, notice: "Account destroyed @#{facebook_account.name}"
  end

  private 

  def set_facebook_account 
    @facebook_account =  Current.account.facebook_accounts.find(params[:id])
  end
end