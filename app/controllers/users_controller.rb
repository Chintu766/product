# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:mail, :password, :role))
    @user.password = @user.password
    if @user.save
      flash[:notice] = 'signned up successfully'
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:mail, :password_digest))
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def my_portfolio
    @articles = Article.all
  end
end
