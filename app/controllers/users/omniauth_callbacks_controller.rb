class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    sign_in_user_and_redirect
  end

  def github
    sign_in_user_and_redirect
  end

  private
    def sign_in_user_and_redirect
      user = User.find_or_create_auth(request.env["omniauth.auth"], current_user)
      #set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      if current_user
        redirect_to 'authentication#home'
      else
        sign_in_and_redirect user, :event => :authentication #this will throw if @user is not activated
      end
    end
end
