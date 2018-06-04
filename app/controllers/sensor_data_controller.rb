class SensorDataController < ApplicationController
  before_action :set_sensor_datum, only: [:show]
  
  # GET /sensor_data
  def index
    @sensor_data = SensorDatum.all
    json_response(@sensor_data)
  end
  
  # GET /sensor_data/:id
  def show
    json_response(@sensor_datum)
  end

  # GET /sensor_data/range/:sensor_id
  # Eg: /sensor_data/range/1?start=2018-06-04T14:42:03.344Z&end=2018-06-04T14:52:03.524Z
  def range
    @data_from_selected_sensor = SensorDatum.where(:sensor_id => params[:sensor_id])
    if params[:start] && params[:end]
      @start_time = Time.parse(params[:start])
      @end_time = Time.parse(params[:end])
      @sensor_datum = @data_from_selected_sensor.where(:created_at => @start_time..@end_time)

    elsif params[:start]
      @start_time = Time.parse(params[:start])
      @sensor_datum = @data_from_selected_sensor.where(:created_at => @start_time..Time.now)
    else
      @sensor_datum = { error: 'Please provide a valid date range'}
    end
    json_response(@sensor_datum)
  end 

  # GET /sensor_data/latest/:sensor_id
  def latest
    @latest_sensor_reading = SensorDatum.where(:sensor_id => params[:sensor_id]).last
    json_response(@latest_sensor_reading)
  end

  
  # POST /sensor_data
  def create
    @sensor_datum = SensorDatum.create!(sensor_datum_params)
    json_response(@sensor_datum)
  end

  private
  
  def sensor_datum_params
    params.permit(:value, :sensor_id)
  end
  
  def set_sensor_datum
    @sensor_datum = SensorDatum.find(params[:id])
  end

end