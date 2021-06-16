class ScoresController < ApplicationController
  def index
    @score = Score.new
    @scores = Score.all.order("created_at DESC")
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
