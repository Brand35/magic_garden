Rails.application.routes.draw do
  resources :flats
  # Root path
  root to: 'items#index'

  # Health check route
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # PWA-related routes
  get 'service-worker', to: 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest', to: 'rails/pwa#manifest', as: :pwa_manifest

  # User authentication
  devise_for :users

  # User routes
  resources :users, only: [] do
    resources :items, only: [:create]
    get :bookings, to: 'bookings#user_bookings', as: :bookings
  end

  # Items routes
  resources :items, only: [:index, :show, :new, :create, :destroy] do
    # Nested bookings routes under items
    resources :bookings, only: %i[new create]
  end

  # Dashboard route
  get 'dashboard', to: 'items#dashboard', as: :dashboard

  # Bookings routes
  resources :bookings, only: %i[index show edit update destroy] do
    # Route for owner's bookings
    collection do
      get 'owner', to: 'bookings#owner_index'
    end

    # Route to update booking status
    member do
      patch :update_status
    end
  end

  # My bookings
  get 'my_bookings', to: 'bookings#my_bookings', as: :my_bookings

  # Search for items
  get 'items/search', to: 'items#search', as: :search_items

end
