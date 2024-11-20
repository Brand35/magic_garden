Rails.application.routes.draw do
  root to: 'items#index'
  get 'owner-items', to: 'items#owner_items'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest

  # Routes for user authentication
  devise_for :users

  # Routes for items
  resources :items, only: %i[new create show] do
    resources :bookings, only: %i[new create]

    # Route for owner's item list
    # collection do
    # end
  end

  resources :bookings, only: %i[index show edit update destroy] do
    collection do
      get 'owner', to: 'bookings#owner_index'
    end
  end

  # Route for item search
  get 'items/search', to: 'items#search', as: 'search_items'
end
