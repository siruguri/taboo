class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def play
    g = Game.find params[:id]

    allowed = true
    if !current_user
      flash[:notice] = "You have to login to play the game."
      allowed = false
    end

    words = g.word_selections

    if words.size == 0
      flash[:notice] = "There are no words assigned to this game."
      allowed = false
    end

    if !allowed
      redirect_to games_path
    else
      if g.current_player != current_user
        @is_player = false
      else
        @is_player = true
        min_count = g.word_selections.select('min(play_count) as minp')[0].attributes['minp']
        @word = g.word_selections.where(play_count: min_count).sample.word
      end
    end
  end

  def rotate
    @g = Game.find params[:id]
    t = @g.turn
    order = t.order

    (_, index) = order.each_with_index.find { |i, idx| i == current_user.id }
    new_user_index = (index + 1) % order.size

    @new_user = User.find(order[new_user_index])
    t.current_player = @new_user
    t.save!

    flash[:notice] = "The game has been rotated to #{@new_user.name}. Please tell them."

    redirect_to play_game_path(@g)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name)
  end
end
