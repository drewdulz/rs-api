class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show]
  before_action :set_plant

  
  # GET /shelves/:shelf_id/pots/:pot_id/plants/:plant_id/sensors

  def index
    json_response(@plant.sensors)
  end
  
  # GET /shelves/:shelf_id/pots/:pot_id/plants/:plant_id/sensors/:id
  def show
    json_response(@sensor)
  end
  
  # POST /shelves/:shelf_id/pots/:pot_id/plants/:plant_id/sensors
  def create
    @plant.sensors.create!(sensor_params)
    json_response(@plant.sensors, :created)
  end

  private
  
  def sensor_params
    params.permit(:name, :sensor_type)
  end
  
  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end
  
end



