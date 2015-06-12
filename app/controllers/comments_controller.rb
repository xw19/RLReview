class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params.except(:post_id))
    @comment.user_id = 1 # to be replaced with current_user
    @post_id = params[:comment][:post_id].to_i
    @comments = Post.find(@post_id).comments.page(params[:page])
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
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :post_id)
  end
end
