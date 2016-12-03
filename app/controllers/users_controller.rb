class UsersController < ApplicationController

  def query
    email = params[:email]
    nonce = params[:token]
    user = User.find_by(:email == email)
    token_user = Token.consume(nonce)
    if user && token_user && user.id == token_user.id
      redirect_to edit_user_path(user)
    else
      flash[:error] = 'User not found.'
    end
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @token = Token.generate(@user)
    puts "EDIT!!!"
    puts @token.inspect
    puts @user.inspect
  end

  def update
    email = params[:email]
    nonce = params[:token]
    puts email
    puts nonce
    user = User.find_by(:email => email)
    token_user = Token.consume(nonce)
    puts user.inspect
    puts token_user.inspect
    if user && token_user && user.id == token_user.id
      puts "you win"
      puts params
      user.update_attributes(user_params)
      flash[:notice] = 'Your email preferences have been saved.'
      redirect_to edit_user_path(user)
    else
      puts "you lose"
      flash[:error] = 'User not found.'
    end
  end

  private

  def user_params
    user_attributes = params.permit(:name, :receiveMarketing, :receiveArticles, :receiveDigest)
    user_params = user_attributes.merge({email: params[:new_email], receiveMarketing: !!params[:receiveMarketing], receiveArticles: !!params[:receiveArticles], receiveDigest: !!params[:receiveDigest]})
  end

  def token_params
    params.require(:token).permit(:user_id, :nonce)
  end

end
