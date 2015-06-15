class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.build_from(@post, current_user.id, params[:comment][:body])
    @comments = @post.root_comments.page(params[:comment][:page])
    if @comment.save
      flash[:notice] = "Commented"
    else
      flash[:alert] = "something went wrong"
    end
    @comment.move_to_child_of(Comment.find(params[:comment][:commentable_id])) if params[:comment][:commentable_type] == "Comment"
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end


  private

  def comments_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :post_id, :page)
  end
end
