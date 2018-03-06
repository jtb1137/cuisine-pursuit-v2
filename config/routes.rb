Rails.application.routes.draw do
  
  resources :cities do
    resources :restaurants
  end

  root 'cities#index'
end
