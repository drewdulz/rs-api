class ShelvesController < ApplicationController
    before_action :set_shelf, only: [:show, :update, :destroy]

  # GET /shelves
  def index
    @shelves = Shelf.all
    json_response(@shelves)
  end

  # POST /shelves
  def create
    @shelf = Shelf.create!(shelf_params)
    json_response(@shelf, :created)
  end

  # GET /shelves/:id
  def show
    json_response(@shelf)
  end

  # PUT /shelves/:id
  def update
    @shelf.update(shelf_params)
    head :no_content
  end

  # DELETE /shelves/:id
  def destroy
    @shelf.destroy
    head :no_content
  end

  private

  def shelf_params
    # whitelist params
    params.permit(:title)
  end

  def set_shelf
    @shelf = Shelf.find(params[:id])
  end
end
