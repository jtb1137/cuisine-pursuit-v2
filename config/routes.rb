Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :cities do
    resources :restaurants
  end

  root 'cities#index'
end
