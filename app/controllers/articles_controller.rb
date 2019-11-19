class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @ranking = Article.all.includes(:likes).order("likes.article_id DESC").limit(10)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to root_path
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  def show
    @ranking = Article.all.includes(:likes).order("likes.article_id DESC").limit(10)
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
    @like = Like.new
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
