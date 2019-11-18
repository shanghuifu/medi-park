class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/articles/#{comment.article.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(article_id: params[:article_id])
  end
end
