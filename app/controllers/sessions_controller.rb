class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(name: params[:name])
    session[:user_id] = @user.id
    redirect_to '/'
  end
  def destroy
    session.clear
    redirect_to '/'
  end
end       
