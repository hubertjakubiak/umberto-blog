class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment has been saved!'
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end