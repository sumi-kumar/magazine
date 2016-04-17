class ArticlesController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]
  def index
    @articles = Article.all
  end

  def show
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "article created!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "article deleted"
    redirect_to article_path(@article)
    
  end

  

  private

  def set_user
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end