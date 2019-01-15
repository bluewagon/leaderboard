class RankingsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @ranking = Ranking.new
  end

  def create
    @ranking = Ranking.new(params[:ranking])
    if @ranking.save
      current_user.user_rankings.build(ranking_id: @ranking.id, admin: true)
      current_user.save!
      flash[:success] = "New group created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @ranking = Ranking.find(params[:id])
    #@user_rankings = @ranking.user_rankings.order('points DESC').all
    @title = @ranking.name
  end
end
