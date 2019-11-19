class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(article_id: params[:article_id])
    redirect_to article_path(params[:article_id])
  end

  def destroy
    @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    @like.destroy
    redirect_to article_path(params[:article_id])
  end
end
