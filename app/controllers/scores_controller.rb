class ScoresController < ApplicationController
  before_action :authenticate_user!
  def index
    @score = Score.new
    @scores = current_user.scores.order("created_at DESC")
    @chart = current_user.scores.pluck(:created_at, :score)
  end

  def create
    @score = Score.new(scores_params)
    if @score.save
      redirect_to root_path
    else

      render :index
    end
  end

  private

  def scores_params
    params.require(:score).permit(:score).merge(user_id: current_user.id)
  end
end
