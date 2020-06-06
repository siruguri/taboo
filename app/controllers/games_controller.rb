class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path, notice: 'Game was successfully created.' }
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
    @game = Game.find params[:id]

    allowed = true
    if !current_user
      flash[:notice] = "You have to login to play the game."
      allowed = false
    end

    words = @game.word_selections

    if words.size == 0
      flash[:notice] = "There are no words assigned to this game."
      allowed = false
    end

    if !allowed
      redirect_to games_path
    else
      @current_player = @game.current_player
      if @current_player != current_user
        @is_player = false
        @word = Struct.new(:label).new('')
      else
        @is_player = true
        @word = @game.current_word
      end
    end
  end

  def refresh
    # Return the current player's ID
    g = Game.find params[:id]
    current_player = g.current_player
    render json: { current_player_id: current_player.id, current_word: g.current_word.label,
                   player_name: current_player.name }
  end

  def rotate
    @g = Game.find params[:id]
    t = @g.turn

    @g.increment_current_word!
    @new_user = t.rotate! current_user

    render json: @new_user
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
