class Rating < ActiveRecord::Base

  belongs_to :game

  belongs_to :rater, class_name: "User"

end
