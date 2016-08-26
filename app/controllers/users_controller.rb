class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end

  def owned
    game = Game.find_by(name: params[:game_name])
    current_user.owned_games << game
    redirect_to "/games/#{game.url}"
  end

  def show
    if !logged_in?
      redirect_to '/'
    end
    @user = User.find_by(username: params[:username])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.delete(:errors)
      session[:username] = @user.username
      redirect_to "/users/#{@user.url}"
    else
      flash[:errors] = @user.errors.full_messages
      render 'session/register'
    end
  end

  def edit
    @user = User.find_by(username: session[:username])
  end

  def update
    if @user.update(user_params)
      redirect_to "/users/#{@user.url}"
    end
  end

  def destroy
    @user.destroy
  end

  private
  def set_user
    @user = User.find_by(username: session[:username])
  end

  def user_params
    params.require(:user).permit(:username, :email, :city, :state, :password, :password_confirmation)
  end

end
