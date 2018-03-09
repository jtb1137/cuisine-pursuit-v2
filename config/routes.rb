Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  resources :cities do
    resources :restaurants
  end

  root 'cities#index'
end