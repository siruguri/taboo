class GameV2sController < ApplicationController
  before_action :set_game_v2, only: [:show, :edit, :update, :destroy]

  # GET /game_v2s
  # GET /game_v2s.json
  def index
    @game_v2s = GameV2.all
  end

  # GET /game_v2s/1
  # GET /game_v2s/1.json
  def show
  end

  # GET /game_v2s/new
  def new
    @game_v2 = GameV2.new
  end

  # GET /game_v2s/1/edit
  def edit
  end

  # POST /game_v2s
  # POST /game_v2s.json
  def create
    @game_v2 = GameV2.new(game_v2_params)

    respond_to do |format|
      if @game_v2.save
        format.html { redirect_to @game_v2, notice: 'Game v2 was successfully created.' }
        format.json { render :show, status: :created, location: @game_v2 }
      else
        format.html { render :new }
        format.json { render json: @game_v2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_v2s/1
  # PATCH/PUT /game_v2s/1.json
  def update
    respond_to do |format|
      if @game_v2.update(game_v2_params)
        format.html { redirect_to @game_v2, notice: 'Game v2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_v2 }
      else
        format.html { render :edit }
        format.json { render json: @game_v2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_v2s/1
  # DELETE /game_v2s/1.json
  def destroy
    @game_v2.destroy
    respond_to do |format|
      format.html { redirect_to game_v2s_url, notice: 'Game v2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_v2
      @game_v2 = GameV2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_v2_params
      params.require(:game_v2).permit(:name)
    end
end
