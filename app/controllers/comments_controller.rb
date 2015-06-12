class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = 1 # to be replaced with current_user
    if @comment.save
      flash[:notice] = "Commented"
    else
      flash[:alert] = "something went wrong"
    end
    redirect_to :back
  end


  private

  def comments_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
