module TagsHelper

  def sort_games(games)
    games.sort{|first, second| first.average_rating <=> second.average_rating}
  end

end
