class GamesController < ApplicationController
  before_action :set_game, only: [ :show, :edit, :update ]

  def index
    @games = Game.all
  end

  def show
  end

  def edit
  end

  def update
    if @game.update(game_params)
      flash[:notice] = "Updated #{@game.away_team} @ #{@game.home_team}"
      redirect_to game_path(@game)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:home_team, :away_team, :home_score, :away_score, :scheduled_at, :rink)
  end
end
