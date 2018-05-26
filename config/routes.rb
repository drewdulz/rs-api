Rails.application.routes.draw do
  resources :todos do
    resources :items
  end
  resources :shelves do
    resources :pots do
      resources :plants
    end
  end
  resources :sensor_datum
end


#  shelf -> pot -> plant1                                                         
#  |        |  `-> plant2                                                         
#  |        `-> moisture                                                          
#  `-> light
