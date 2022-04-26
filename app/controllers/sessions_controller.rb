class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #first lookup the user in database
    @user = User.find_by(email: user_params[:email])
    #raise @user.inspect
    if @user && @user.is_password?(user_params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to sign_in_path, notice: "Email or Password not valid! Try again.."
    end
    #then compare password

  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
