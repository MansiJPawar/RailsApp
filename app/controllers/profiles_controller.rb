class ProfilesController < ApplicationController
# before_action :authenticate_user!, except: [ :show, :index ]

 #to load post on only show view
 before_action :set_profile,only: [:show] 

  def new
    @profile = Profile.new
  end 

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
end
