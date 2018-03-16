Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :restaurants do
    collection do
      get 'search'
    end
    put :favorite, on: :member # adds favorite_restaurant_path
  end
  
  get 'users/:id', to: 'users/profiles#show', as: :profile
  get 'users/:id/edit', to: 'users/profiles#edit', as: :edit_profile
  patch 'users/:id', to: 'users/profiles#update', as: :update_profile

  root 'restaurants#index'
end