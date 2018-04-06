Rails.application.routes.draw do
  resources :todos do
    resources :items
  end
  resources :shelf do
    resources :pot do
      resources :plant
    end
  end
end


#  shelf -> pot -> plant1                                                         
#  |        |  `-> plant2                                                         
#  |        `-> moisture                                                          
#  `-> light
