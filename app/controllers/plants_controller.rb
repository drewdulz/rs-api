class PlantsController < ApplicationController

  before_action :set_pot
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET /shelves/:shelf_id/pots/:pot_id/plants
  def index
    json_response(@pot.plants)
  end

  # GET /shelves/:shelf_id/pots/:pot_id/plants
  def show
    render json: @plant, include: 'sensors'
  end

  # POST /shelves/:shelf_id/pots/:pot_id/plants
  def create
    @pot.plants.create!(plant_params)
    json_response(@pot.plants, :created)
  end

  # PUT /shelves/:shelf_id/pots/:pot_id/plants/:id
  def update
    @plant.update(plant_params)
    head :no_content
  end

  # DELETE /shelves/:shelf_id/pots/:pot_id/plants/:id
  def destroy
    @plant.destroy
    head :no_content
  end

  private

  def plant_params
    params.permit(:name)
  end

  def set_pot
    @pot = Pot.find(params[:pot_id])
  end

  def set_plant
    @plant = @pot.plants.find_by!(id: params[:id]) if @pot
  end
end
