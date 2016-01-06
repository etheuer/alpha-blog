class ArticlesController < ApplicationController
  # calls method before_action at the beginnig of all actions specified at "only" (which could be left out in case there were no exceptions)
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Article was successfully deleted!"
  end
  
  private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end