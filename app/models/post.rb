class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :replies
  attr_accessible :content, :title, :category_id, :replies_attributes

  accepts_nested_attributes_for :replies

  validates_presence_of :category, :user, :title, :content
end
