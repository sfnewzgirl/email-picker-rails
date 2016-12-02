class UsersController < ApplicationController

  def index
    @users = User.all
    @user_input = params[:q]
    @found_user = User.all.select{|user| user.email == @user_input}
    #add in here and and a token true
    # redirect_to edit_user_path(@user)
  end

  def query
    email = params[:email]
    nonce = params[:token]
    puts email
    puts nonce
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def update
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    if @user.update_attributes(user_params)
      flash[:notice] = 'Your email preferences have been saved.'
      redirect_to root_path
    else
      flash[:notice] = 'Something went wrong. Please try again.'
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :receiveMarketing, :receiveArticles, :receiveDigest)
  end

  def token_params
    params.require(:token).permit(:user_id, :nonce)
  end

end
