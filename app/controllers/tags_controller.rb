class TagsController < ApplicationController

  # need to protect route
  def index
    if params[:search]
      @tags = Tag.search(params[:search])
    else
      @tags = Tag.all
    end
  end

  def new
    @tag = Tag.new()
  end

  def update
  end

# route to find all the games associated with a tag
# sorts by the game's average rating
  def show
    @tag = Tag.find_by(name: params[:tag_name])
    if @tag && @tag.games
      @games = @tag.games.sort{|first, second| first.average_rating <=> second.average_rating}
    else
      redirect_to "/"
    end
  end


end
