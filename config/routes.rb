UsedCars::Application.routes.draw do
  resources :cars, only: [:new, :create]
end
