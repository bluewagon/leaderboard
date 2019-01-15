class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @user_rankings = @user.user_rankings.all
      @title = @user.email
    end
  end
end
