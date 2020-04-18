class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index
    @words = Word.all
  end

  def add_form
  end


  def add_words
    @words = params[:wordlist].split("\n")

    @new_word_count = 0
    @words.map { |w| w.strip.downcase }.each do |w|
      w = Word.find_or_initialize_by label: w
      if w.id.nil?
        @new_word_count += 1 
        w.save!
      end
    end

    flash[:new_word_count] = @new_word_count
    redirect_to add_form_words_path
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.fetch(:word, {})
    end
end
