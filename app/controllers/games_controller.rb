class GamesController < ApplicationController
  before_action :set_game, only: [ :show, :edit, :update, :destroy ]

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

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.errors.any?
      render :new, status: :unprocessable_entity
    else
      redirect_to game_path(@game)
    end
  end

  def destroy
    @game.destroy
    flash[:notice] = "Deleted #{@game.away_team} @ #{@game.home_team}"
    redirect_to games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:home_team, :away_team, :home_score, :away_score, :scheduled_at, :rink)
  end
end
