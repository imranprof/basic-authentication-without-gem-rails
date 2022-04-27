class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #raise @user.inspect
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      #render :action => :new, :notice =>  "Invalid Email or Password less then 6 character."

      redirect_to register_path, notice: "Invalid Email or Password less then 6 character."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
