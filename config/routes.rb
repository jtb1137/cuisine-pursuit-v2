Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :restaurants, only: :new

  resources :cities do
    resources :restaurants do
      put :favorite, on: :member # adds favorite_restaurant_path
    end
  end

  get ':username', to: 'users/profiles#show', as: :profile

  root 'cities#index'
end