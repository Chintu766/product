# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    # byebug
    user = User.find_by(mail: params[:session][:mail])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to articles_path
    else
      flash[:notice] = 'There was something wrong with your login details'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:now] = 'Logged out'
    redirect_to login_path
  end
end
