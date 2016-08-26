class Comment < ActiveRecord::Base

  belongs_to :commenter, class_name: "User"

  belongs_to :game

  has_many :votes

  def vote_count
    votes.inject(0) {|sum, val| sum += val.value; sum}
  end

end
