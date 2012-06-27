class PostsController < ApplicationController
  before_filter :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(params[:post])
    @post.save
    if @post.parent_post_number
      increment (Post.find(@post.parent_post_number))
    end
      redirect_to :back
  end

  def post_report_descending
    @desc = Post.all(:order => "rank")
  end

  def increment (parent)
    parent.rank += 1
    parent.save
  end

  def destroy
    @posts=Post.find_all_by_parent_post_number(@post.id)
    @posts.each do |post|
      post.destroy
    end
    @post.destroy
    redirect_to :back
  end

  private
  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if @post.nil?
  end
end
