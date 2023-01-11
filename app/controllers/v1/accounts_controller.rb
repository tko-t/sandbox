class V1::AccountsController < ApplicationController
  def index
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    Accounts::Create.run!(params.permit(*(Accounts::Create.account_attrs + Accounts::Create.profile_attrs)))
  end
end
