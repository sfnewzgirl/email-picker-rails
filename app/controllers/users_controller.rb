class UsersController < ApplicationController

  def index
  end

  def search
    @user_input = params[:q]
    @found_user = User.all.select{|user| user.email == @user_input}
    redirect_to edit_user_path(@found_user)
  end

end
