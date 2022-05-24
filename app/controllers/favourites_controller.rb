# frozen_string_literal: true

class FavouritesController < ApplicationController
  def new
    @favourite = Favourite.new
  end

  def create
    # byebug
    @favourite = Favourite.new(params.require(:favourite).permit(:user_id))
    @favourite.user_id = current_user.id
    if @favourite.save
      flash[:notice] = 'created'
      redirect_to articles_path
    end
  end

  def index
    @favourite = current_user
    @fav = @favourite.favourite.articles
    @fav
  end

  def fav
    @article = Article.find(params[:id])
    @fav = current_user.favourite
    @fav.articles << @article
    @fav
    flash[:notice] = 'added successfully'
    redirect_to articles_path
  end
end
