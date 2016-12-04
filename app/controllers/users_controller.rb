class UsersController < ApplicationController

  def index
    redirect_to root_path
  end

  def query
    email = params[:email]
    nonce = params[:token]
    user = User.find_by(email: email)
    token_user = Token.consume(nonce)
    if user && token_user && user.id == token_user.id
      redirect_to edit_user_path(user)
    end
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @token = Token.generate(@user)
  end

  def update
    email = params[:email]
    nonce = params[:token]
    new_email = params[:new_email]
    user = User.find_by(email: email)
    token_user = Token.consume(nonce)
    if user && token_user && user.id == token_user.id
      if email != new_email
        email_user = User.find_by(email: new_email)
        if email_user
          flash[:error] = 'That email is already in use. Please choose another email address.'
          return redirect_to edit_user_path(user)
        end
      end
      user.update_attributes(user_params)
      flash[:notice] = 'Your changes have been saved.'
      return redirect_to edit_user_path(user)
    else
      flash[:error] = 'User not found.'
    end
  end

  private

  def user_params
    user_attributes = params.permit(:name, :receiveMarketing, :receiveArticles, :receiveDigest)
    user_params = user_attributes.merge({email: params[:new_email], receiveMarketing: !!params[:receiveMarketing], receiveArticles: !!params[:receiveArticles], receiveDigest: !!params[:receiveDigest]})
  end

end
