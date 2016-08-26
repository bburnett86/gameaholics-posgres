class Vote < ActiveRecord::Base
  belongs_to :comment

  belongs_to :voter, class_name: "User"

  validate :one_vote_only

  def one_vote_only
    if User.find(self.voter_id).votes.find_by(comment_id: comment_id) != nil
      @errors.add(:user, "has already voted")
    end
  end

end
