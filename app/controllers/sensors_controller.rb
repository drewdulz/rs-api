class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show]
  
  # GET /sensors
  def index
    @sensor = Sensor.all
    json_response(@sensor)
  end
  
  # GET /sensors/:id
  def show
    json_response(@sensor)
  end
  
  # POST /sensors
  def create
    @sensor = Sensor.create!(sensor_params)
    json_response(@sensor)
  end

  private
  
  def sensor_params
    params.permit(:name, :sensor_type)
  end
  
  def set_sensor
    @sensor = Sensor.find(params[:id])
  end
  
end



