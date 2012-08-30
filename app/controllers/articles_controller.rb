class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = current_user.articles
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    @article = current_user.articles.build(params[:article])

    if @article.save
      redirect_to @article, notice: 'You have successfully created an Article.' 
    else
      render action: "new" 
    end
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_url, notice: 'Article was deleted successfully.' 
  end
end
