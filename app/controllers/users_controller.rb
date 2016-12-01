class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:alert] = 'Your profile has been saved.'
      redirect_to edit_user_path
    else
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by(email: params[:email])

  def edit
    @user = User.find_by(email: params[:email])
  end

  def update
    @user = User.find_by(email: params[:email])
    if @user.update(user_params)
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
  end
end
