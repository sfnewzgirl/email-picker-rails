class UsersController < ApplicationController
  def index

  end

  def edit

  end

  def update

  end

  # mocks up search for user by email and token
  # def user_search(email, token)
  #   user = Token.consume(token)
  #   if user = nil
  #     flash[:error] = "Your account can not be validated."
  #   elsif user.email == params[:email]
  #     toke = Token.generate(user)
  #     render edit_user_path
  #   else
  #     flash[:error] = "Your account can not be validated."
  #     redirect root_path
      # end
  # end

end
