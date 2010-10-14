class ArticlesController < ApplicationController
  
  before_filter :get_article, :except => [:index, :new]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def show
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = 'Your article was created'
      redirect_to @article
    else
      flash.now[:error] = 'There were errors'
      render :action => :new
    end
  end
  
  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = 'Your article was updated'
      redirect_to @article
    else
      flash.now[:error] = 'There were errors'
      render :action => :edit
    end
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Your article '#{@article.title}' was deleted"
    redirect_to :action => :index
  end
  
  
  private
  
  def get_article
    @article = Article.find(params[:id])
  end


end
