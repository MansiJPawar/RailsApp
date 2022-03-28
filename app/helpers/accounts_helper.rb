module AccountsHelper
  #profile thumb
  def profile_picture account, width = 100
    image_path = account.image.present? ? account.image.thumb.url : "ruby.png"
    image_tag(image_path, width: width, class: "img-circle m-r-10")
  end

  #only logged in user can edit his own profile
  def can_edit_profile? profile_id
    account_signed_in? && current_account.id == profile_id
  end 
end
