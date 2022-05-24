# frozen_string_literal: true

class SharesController < ApplicationController
  def new
    @share = Share.new
  end

  def create
    # byebug
    @share = Share.new(params.require(:share).permit(:user_id))
    @share.user_id = current_user.id
    if @share.save
      flash[:notice] = 'created'
      redirect_to articles_path
    end
  end

  def index
    @share = Share.first
    @share = @share.articles
    @share
  end

  def share
    @article = Article.find(params[:id])
    @share = current_user.share
    @share.articles << @article
    @share
    flash[:notice] = 'added successfully'
    redirect_to articles_path
  end
end
