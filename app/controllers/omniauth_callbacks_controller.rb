# class OmniauthCallbacksController < ApplicationController
 
#  def facebook
#     Current.account.facebook_accounts.create[
#       name: auth.info.name,
#       username: auth.info.nickname,
#       image: auth.info.image,
#       token: auth.credentials.token,
#       secret: auth.credentials.secret,
#     ]

#     redirect_to root_path, notice: "Connected to facebook"
#   end

#   def auth 
#     request.env['omniauth.auth']
#   end
# end