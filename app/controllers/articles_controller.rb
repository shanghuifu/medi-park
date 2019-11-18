class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
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
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
