class RankingsController < ApplicationController

  def index
    @scores = Score.all.includes(:user).order('score DESC').limit(30)
  end
end
