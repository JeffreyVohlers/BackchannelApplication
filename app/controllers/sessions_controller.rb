class SessionsController < ApplicationController
  def new
  end
  def destroy
    sign_out
    redirect_to root_path
  end

  def create
    user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      render "pages/home"
    end
  end

  def search
    @type = params[:search_type]
    if (@type <=> 'users') == 0
      @results = Array.new
      User.all.each do |i|
        if i.username.downcase.include?(params[:q].downcase)
          puts i.username
          @results << i
        end
      end
    end
    if (@type <=> 'posts') == 0
      @results = Array.new
      Post.all.each do |j|
        if j.content.downcase.include?(params[:q].downcase)
          puts j.content
          @results << j
        end
      end
    end
  end
end

