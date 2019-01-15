class UserRankingsController < ApplicationController
  before_filter :authenticate_user!

  def addpoint
    @user_ranking = UserRanking.find(params[:id])
    @user_ranking.update_attribute :points, @user_ranking.points + 1
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def removepoint
    @user_ranking = UserRanking.find(params[:id])
    @user_ranking.update_attribute :points, @user_ranking.points - 1
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
