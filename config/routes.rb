Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :restaurants do
    put :favorite, on: :member # adds favorite_restaurant_path
  end

  get ':username', to: 'users/profiles#show', as: :profile

  root 'restaurants#index'
end