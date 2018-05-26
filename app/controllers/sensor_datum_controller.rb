class SensorDatumController < ApplicationController
  before_action :set_sensor_datum, only: [:show]
  # before_action :set_sensor_datum
  
  # GET /sensor_datum
  def index
    @sensor_datums = SensorDatum.all
    json_response(@sensor_datums)
  end
  
  # GET /sensor_datum/:id
  def show
    json_response(@sensor_datum)
  end
  
  # POST /sensor_datum
  def create
    @sensor_datum = SensorDatum.create!(sensor_datum_params)
    json_response(@sensor_datum)
  end

  private
  
  def sensor_datum_params
    params.permit(:timeStamp, :value)
  end
  
  def set_sensor_datum
    @sensor_datum = SensorDatum.find(params[:id])
  end
  
  # def set_shelf_pot
  #   @pot = @shelf.pots.find_by!(id: params[:id]) if @shelf
  # end
end



