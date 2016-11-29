class UsersController < ApplicationController
  # before_action :authorize only: [:edit, :update]

  def index
  end

  def edit
    # get user
  end

  def update
    # save changes
  end

  def authorize
    # good example!!!
    #   def authenticate_by_token
    #     authenticate_with_http_token do |token, options|
    #     user = User.find_by(id: options[:uid])
    #     if user && ActiveSupport::SecurityUtils.secure_compare(user.auth_token, token)
    #       @current_user = user
    #     end
    #   end

    # take in email in search query
    # user email to find associated nonce
    # if email and nonce match return edit view

    @token = Token.find_by_nonce(params[:token])
    if @user[:token] = @token
      @token.destroy
      true
    else @user[:token] = nil
      false
    end
  end

  # mocks up search for user by email and token
  # def user_search(email, token)
  #   user = Token.consume(token)
  #   if user = nil
  #     flash[:error] = "Your account can not be validated."
  #   elsif user.email == params[:email]
  #     token = Token.generate(user)
  #     render edit_user_path
  #   else
  #     flash[:error] = "Your account can not be validated."
  #     redirect root_path
      # end
  # end

  # ??? DO I NEED IF EMAIL MATCHES BUT TOKEN DOESNT
  # If the user tries to choose an email address which is already assigned to another user in the system, it should display an error.

end
