module AccountsHelper

  def profile_picture account, width = 40
    image_path = account.image.present? ? account.image.thumb.url : "ruby.png"
    image_tag(image_path, width: width, class: "img-circle")
  end

  #only logged in user can edit his own profile
  def can_edit_profile? profile_id
    account_signed_in? && current_account.id == profile_id
  end 
end
