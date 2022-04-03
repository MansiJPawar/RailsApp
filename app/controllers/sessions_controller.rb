class SessionsController <  ApplicationController
  
  #to create new account 
  def new 
  end 

  def create
    account =  Account.find_by(email: params[:email])
    #authenticate method from has_secure_password in account model
    if account.present? && account.authenticate(params[:password])
      session[:account_id] = account.id
      redirect_to root_path, notice: "Logged in"
    else 
      flash[:alert] = "invalid password"
      render :new
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_path, notice: "LOgged out"  
  end
end