class UsersController < ApplicationController
  def create
    redirect_to '/sessions/create'
  end
end
