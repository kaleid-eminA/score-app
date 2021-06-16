class ScoresController < ApplicationController
  def index
    @score = Score.all
  end
end
