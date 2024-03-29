class CardsController < ApplicationController
  # Uncomment line bellow to skip authentication
  # skip_before_action :authenticate_user!, raise: false
  before_action :set_card, only: %i[show edit update destroy move]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        ActionCable.server.broadcast "board", { commit: 'addCard', payload: render_to_string(:show, formats: [:json]) }
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)

        ActionCable.server.broadcast "board", { commit: 'editCard', payload: render_to_string(:show, formats: [:json]) }

        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move
    @card.update(card_params)
    ActionCable.server.broadcast "board", { commit: 'moveCard', payload: render_to_string(:show, formats: [:json]) }
    render action: :show
  end

  def attach
    attachment = Attachment.create!(image: params[:image])
    render json: { filename: url_for(attachment.image) }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:list_id, :title, :content, :position)
  end
end
