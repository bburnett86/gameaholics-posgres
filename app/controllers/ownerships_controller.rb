class OwnershipsController < ApplicationController


  def create_index
    current_user.owned_games << Game.find_by(name: params[:game_name])
    redirect_to '/'
  end

  def create_game
    game = Game.find_by(name: params[:game_name])
    current_user.owned_games << Game.find_by(name: params[:game_name])
    redirect_to "/games/#{game.url}"
  end

end
