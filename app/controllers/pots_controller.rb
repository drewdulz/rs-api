class PotsController < ApplicationController
  before_action :set_shelf
  before_action :set_shelf_pot, only: [:show, :update, :destroy]

  # GET /shelves/:shelf_id/pots
  def index
    json_response(@shelf.pots)
  end

  # GET /shelves/:shelf_id/pots/:id
  def show
    render json: @pot, include: 'plants'
  end

  # POST /shelves/:shelf_id/pots
  def create
    @shelf.pots.create!(pot_params)
    json_response(@shelf, :created)
  end

  # PUT /shelves/:shelf_id/pots/:id
  def update
    @pot.update(pot_params)
    head :no_content
  end

  # DELETE /shelves/:shelf_id/pots/:id
  def destroy
    @pot.destroy
    head :no_content
  end

  private

  def pot_params
    params.permit(:name)
  end

  def set_shelf
    @shelf = Shelf.find(params[:shelf_id])
  end

  def set_shelf_pot
    @pot = @shelf.pots.find_by!(id: params[:id]) if @shelf
  end
end