class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_rankings = @user.user_rankings.all
    @title = @user.email
  end
end
