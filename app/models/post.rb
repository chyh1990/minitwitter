class Post < ActiveRecord::Base
  attr_accessible :body, :poster
  has_many :comments
  validates :body, :presence => true
  validates :poster, :presence => true
end
