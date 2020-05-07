class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post has been created successfully!'
    else
      render :new, danger: "Post hasn't been created."
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Post has been updated successfully!'
    else
      render :edit, danger: "Post hasn't been updated."
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Post has been deleted successfully!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end

end
