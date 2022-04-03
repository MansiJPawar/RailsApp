class MainController <  ApplicationController 
  def index
    if session[:account_id]
      #find_by cant throw error when it cant find user 
      @account =  Account.find_by(id: session[:account_id])
    end
  end
end
