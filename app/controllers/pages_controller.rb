class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    @recents = Post.recents
  end
end