class PagesController < ApplicationController
  def home
    if signed_in?
      @post = current_user.posts.build
    end
  end

  def index
    User.find_by_username(params[:session][:username])
  end
end
