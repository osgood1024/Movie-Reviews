class ReviewsController < ApplicationController
  before_action :find_post,only: [:show, :edit, :update]
  def index @posts=Post.all
  end
  def show end
  def new
  @post = Post.new()
  end
  end
  def create
  @post = Post.create(post_params)
  if @post.valid? redirect_to @post
  else
  end end
  def edit end
  def update @post.update(params.require(:post).permit!) if @post.valid?
  redirect_to @post else
  flash[:errors]=@post.erors.full_messages redirect_to edit_post_path
  end end
  def delete Post.find(params[:id]).delete redirect_to new_posts_page
  end
  private
  def post_params params.require(:post).permit!
  end
  def find_post
  @post = Post.find(params[:id])
  end
end
