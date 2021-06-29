class RankingsController < ApplicationController

  def index
    @users = User.all
    @scores = Score.all.includes(:user).order('score DESC').limit(30)
  end
end
