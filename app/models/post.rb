class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :content, :title, :category_id

  validates_presence_of :category, :user, :title, :content
end
