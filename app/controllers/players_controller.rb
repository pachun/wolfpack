class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:notice] = "Updated #{@player.first_name} #{@player.last_name}"
      redirect_to(player_path(@player))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.errors.any?
      render :new, status: :unprocessable_entity
    else
      redirect_to player_path(@player)
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name)
  end
end
