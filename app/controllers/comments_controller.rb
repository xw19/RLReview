class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comments_params.except(:post_id, :page))
    @comment.user = current_user
    @post_id = params[:comment][:post_id].to_i
    @comments = Post.find(@post_id).comments.includes(:comments, :user, :reports).page(params[:comment][:page])
    if @comment.save
      flash[:notice] = "Commented"
    else
      flash[:alert] = "something went wrong"
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


  private

  def comments_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :post_id, :page)
  end
end
