class ProfilesController < ApplicationController
  # before_action :authenticate_user!, except: [ :show, :index ]

 #to load post on only show view
 before_action :set_profile,only: [:show] 

  # GET 
  # def index
  #   @sports = Sport.all
  # end

  #to create new post
  def new
    @profile = Profile.new
  end 

  # GET /sports/new
  # def new
  #   @sport = Sport.new
  # end

  # GET /sports/1/edit
  def edit
  end

  def create
    #direct to create post
    @profile = Profile.new(profile_params)

    #associate and check if user signed in
    @profile.user_id = current_user.id if user_signed_in?

    #template to save post and redirect
    if @profile.save
      redirect_to dashboard_path, flash: { success: "Profile was created successfully!"}
    else
      redirect_to new_post_path, flash: { success: "Profile was created successfully"}
    end
  end


  # PATCH/PUT /sports/1 or /sports/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to sport_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @sport }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /sports/1 or /sports/1.json
  # def destroy
  #   @sport.destroy

  #   respond_to do |format|
  #     format.html { redirect_to sports_url, notice: "Sport was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  #server side dataTable
  def get_dataset
    render json: { sports: Sport.page(params[:page]).per(per_page) }
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sport_params
      params.require(:sport).permit(:sport_name, :sport_equipement)
    end
end
