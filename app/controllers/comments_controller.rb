class CommentsController < ApplicationController

  def create
    session[:return_to] ||= request.referer
    @comment = Comment.new(comments_params)
    @comment.user_id = 1 # to be replaced with current_user
    if @comment.save
      flash[:notice] = "Commented"
    else
      flash[:alert] = "something went wrong"
    end
    redirect_to session.delete(:return_to)
  end


  private

  def comments_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
