class ScoresController < ApplicationController
  def index
    @score = Score.new
  end

  def create
    @score = Score.new(scores_params)
    if @score.save
      redirect_to root_path
    end
  end

  private

  def scores_params
    params.require(:score).permit(:score).merge(user_id: current_user.id)
  end
end
