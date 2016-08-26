require 'bcrypt'
require 'uri'

class User < ActiveRecord::Base
  include BCrypt

  has_many :ownerships, foreign_key: :owner_id

  has_many :owned_games, through: :ownerships, source: :game

  has_many :ratings, foreign_key: :rater_id

  has_many :votes, foreign_key: :voter_id

  has_many :comments, foreign_key: :commenter_id

  has_secure_password

  validates :username, :email, :city, :state, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }



  def self.authenticate(email, password)
    if user = User.find_by(email: email)
      if user.authenticate(password)
        return user
      end
    end
    nil
  end

  def rating_for_game(game)
    rating = self.ratings.find_by(game_id: game.id)
    if rating
      return rating.value
    else
      return nil
    end
  end


  def top_rated_games
    self.owned_games.sort{|first, second| first.average_rating <=> second.average_rating}
  end

  def url
    URI.escape(self.username)
  end

end
