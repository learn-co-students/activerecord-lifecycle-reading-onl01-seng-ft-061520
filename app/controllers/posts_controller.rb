class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params.require(:post).permit(:title, :description))
    # @post = Post.new(params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:title, :description, :post_status, :author_id))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end
end
