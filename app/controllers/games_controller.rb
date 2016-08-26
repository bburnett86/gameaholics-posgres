class GamesController < ApplicationController

  # def create
  #   @game = Game.new(game_params)
  #   p @game
  #   if @game.save
  #     redirect_to '/'
  #   else
  #   end
  # end

  def index
  end

  def new
    @game = Game.new
    @game.tags.build
  end

  def rate_game
    @game = Game.find_by(name: params[:game_name])
    rating_value = params[:rate_value]
    current_user.ratings << Rating.new(rater_id: current_user.id, value: rating_value, game_id: @game.id)
    redirect_to "/users/#{current_user.url}"
  end

  def show
    @comment = Comment.new
    @game = Game.find_by(name: params[:game_name])
  end


  def create
    # p params
    # p game_params
    # p "========================================"
    # p tag_list
    #   p "========================================"
    @game = Game.new(game_params)
    if @game.save


      tags_string = tag_names_list
      tags_array = tags_string.split(',')
      if tags_array.count > 0
        tags_array.each do |tag|
          @game.tags << Tag.find_or_create_by(name: tag)
        end
      end


      flash.delete(:errors)
      redirect_to "/games/#{@game.url}"
    else
      flash[:errors] = @game.errors.full_messages
      redirect_to '/games/new'
    end
  end

  def show
    @game = Game.find_by(name: params[:game_name])
    @comment = Comment.new
  end

  def edit
    redirect_to "/"
    # @game = Game.find_by(name: params[:game_name])
  end

  def update
    redirect_to "/"
    # @game = Game.find_by(name: params[:game_name])
    # @game.update(game_params)
    # if @game.save
    #   tags_string = tag_names_list
    #   tags_array = tags_string.split(',')
    #   if tags_array.count > 0
    #     tags_array.each do |tag|
    #       @game.tags << Tag.find_or_create_by(name: tag)
    #     end
    #   end


    #   flash.delete(:errors)
    #   redirect_to "/games/#{@game.url}"
    # else
    #   flash[:errors] = @game.errors.full_messages
    #   redirect_to '/games/new'
    # end
  end

  def owned
    game = Game.find_by(name: params[:game_name])
    current_user.owned_games << game
    redirect_to "/games/#{game.url}"
  end



private
  def game_params
    params.require(:game).permit(:name, :description, :rules_url, :image_url)
  end

  def tag_names_list
    params.require(:game).permit(tags_attributes: [:names_list])[:tags_attributes]["0"][:names_list]
  end

end
