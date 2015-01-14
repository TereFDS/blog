module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        user_logged_in(@user)
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    private

    def user_logged_in(user)
      sign_in_and_redirect user, event: :authentication # this throws if @user is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    end
  end
end