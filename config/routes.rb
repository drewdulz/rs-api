Rails.application.routes.draw do
  resources :shelves do
    resources :pots do
      resources :plants do
        resources :sensors
      end
    end
  end
  resources :sensor_data
  get '/sensor_data/range/:sensor_id', to: 'sensor_data#range'
  get '/sensor_data/latest/:sensor_id', to: 'sensor_data#latest'

  resources :sensors, only: [:show, :create, :index]
  
end


#  shelf -> pot -> plant1
#  |        |  `-> plant2
#  |        `-> moisture
#  `-> light
