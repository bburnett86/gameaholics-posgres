class Tag < ActiveRecord::Base

  has_many :taggings

  has_many :games, through: :taggings

  attr_accessor :names_list

  validates_uniqueness_of :name

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

end
