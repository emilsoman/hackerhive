class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    if current_user
      redirect_to 'authentication#home'
    else
      sign_in_and_redirect user, :event => :authentication #this will throw if @user is not activated
    end
  end

  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)
    set_flash_message(:notice, :success, :kind => "GitHub") if is_navigational_format?
    if current_user
      redirect_to 'authentication#home'
    else
      sign_in_and_redirect user, :event => :authentication #this will throw if @user is not activated
    end
  end
end
