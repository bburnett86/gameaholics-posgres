class SessionController < ApplicationController

  def new
    if logged_in?
      redirect_to "/users/#{current_user.username}"
    else
      @user = User.new
    end
  end

  def login
    if logged_in?
      @user = current_user
      redirect_to "/users/#{current_user.username}"
    else
      if @user = User.authenticate(login_params[:email], login_params[:password])
        flash.delete(:errors)
        session[:username] = @user.username
        redirect_to "/users/#{@user.username}"
      else
        @user = User.new
        flash[:errors] = ["Invalid Login Credentials"]
        render 'session/new'
      end
    end

  end

  def logout
    flash.delete(:errors)
    session.delete(:username)
    redirect_to '/'
  end

  def register
    if logged_in?
      redirect_to "/users/#{current_user.username}"
    end
    @user = User.new
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end


end
