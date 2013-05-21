class PagesController < ApplicationController
  def home
    @recents = Post.recents
  end
end