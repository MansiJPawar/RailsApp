class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!
  
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
  
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
    end

    #server side dataTable
    def get_dataset
      render json: { users: User.all }
    end

    def failure
      redirect_to root_path
    end
  
    def show
      @user = User.find(params[:id])
    end
    
    def new
      @user = User.new
    end

    # # PATCH/PUT /sports/1 or /sports/1.json
    # def update
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to sport_url(@user), notice: "User was successfully updated." }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    
    # def create
    #   @article = Article.new(article_params)
  
    #   if @article.save
    #     redirect_to @article
    #   else
    #     render :new, status: :unprocessable_entity
    #   end
    # end
    
    # Only allow a list of trusted parameters through.
    # def user_params
    #   params.require(:user).permit(:email, :image)
    # end
  end
end