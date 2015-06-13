class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user # Currently there is only one author
    if @post.save
      redirect_to @post, notice: "Post successfully created"
    else
      flash.now[:alert] = "Somethng went wrong"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to @post, notice: "Post successfully updated"
    else
      flash.now[:alert] = "Somethng went wrong"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to post_index_path, notice: "Post has been deleted"
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:comments).page(params[:page])
  end

  private

  def posts_params
    params.require(:post).permit(:title, :category_string, :body)
  end

end
