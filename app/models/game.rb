class Game < ActiveRecord::Base

  has_many :taggings

  has_many :tags, through: :taggings

  has_many :ownerships

  has_many :owners, through: :ownerships

  has_many :comments

  has_many :ratings, foreign_key: :rater_id

  validates :name, uniqueness: true

  validates :name, presence: true

  accepts_nested_attributes_for :tags

  def average_rating
    return 0 if ratings.length == 0
    ratings = self.ratings
    total = ratings.reduce(0) do |sum, rating|
      sum + rating.value
    end
    return total / ratings.length
  end

  def ratings_sort(games)
    games.sort{|first, second| first.average_rating <=> second.average_rating}
  end

  def self.all_rated_high_to_low
    Game.all.sort{|first, second| first.average_rating <=> second.average_rating}
  end

  def url
    URI.escape(self.name)
  end

end
