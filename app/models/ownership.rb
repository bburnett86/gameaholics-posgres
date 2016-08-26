class Ownership < ActiveRecord::Base

  belongs_to :owner, class_name: "User"

  belongs_to :game

  validate :unique_owner_scope, on: :save

  def unique_owner_scope
    if owner.owned_games.include?(game)
      @errors.add(:user, "you already own this game.")
    end
  end

end
