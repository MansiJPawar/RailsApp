class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!
  
    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      #if user exist navigate 
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
      #if user not exist create
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end  
    end

    #destroy user 
    def destroy
      @user = Current.user.find(params[:id])
      @user.destroy
      redirect_to root_path, notice: "Account destroyed @#{user.name}"
    end

    #error flash messages
    def failure
      flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
end