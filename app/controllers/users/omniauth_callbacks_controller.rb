class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!
  
    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
    
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end

      respond_to do |format|
        format.html
        format.csv { send_data @users.to_csv(['name', 'email']) }
      end
    end

    #server side dataTable
    def get_dataset
      users = User.from_omniauth(request.env["omniauth.auth"])
      render json: { users: User.all }
    end

    def failure
      # session[:user_id] = nil
      flash[:error] = "Invalid SignIn try later"
      redirect_to new_user_registration_url
    end
end