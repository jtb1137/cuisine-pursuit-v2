Rails.application.routes.draw do
  
  devise_for :users
  resources :cities do
    resources :restaurants
  end

  root 'cities#index'
end
