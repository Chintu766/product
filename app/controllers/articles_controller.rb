# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @users = @article.users
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'created successfully'
      redirect_to articles_path
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :description))
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = 'destroyed successfully'
      redirect_to articles_path
    end
  end

  def liked_article
    # byebug
    @article = Article.find(params[:id])
    Like.create(user_id: current_user.id, article_id: @article.id)
    flash[:notice] = "u liked article #{@article.id}"
    redirect_to article_path(@article)
  end

  def search
    if params[:article].present?
      @articles = Article.title_matches(params[:article])
      render 'users/my_portfolio'
    else
      flash[:notice] = 'enter a valid title'
      redirect_to articles_path
    end
  end
end
