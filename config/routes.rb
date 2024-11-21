Rails.application.routes.draw do
  # Root path
  root to: 'items#index'
  get 'owner-items', to: 'items#owner_items', as: :owner_items

  # Health check route
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # PWA-related routes
  get 'service-worker', to: 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest', to: 'rails/pwa#manifest', as: :pwa_manifest

  # User authentication
  devise_for :users

  # Items routes
  resources :items, only: %i[new create show] do
    # Nested bookings routes under items
    resources :bookings, only: %i[new create]
    member do
      patch :update_status # Route pour mettre à jour le statut d'une réservation
    end
  end

 # bookings routes
resources :bookings, only: %i[index show edit update destroy] do
  # Route pour les réservations du propriétaire
  collection do
    get :owner, to: 'bookings#owner_index' # Ex: /bookings/owner
  end

  # booking status update route
  member do
    patch :update_status # Ex: /bookings/:id/update_status
  end
end



  # Search for items
  get 'items/search', to: 'items#search', as: :search_items

  # User-specific bookings
  get 'users/:id/bookings', to: 'bookings#user_bookings', as: :user_bookings

  # My bookings
  get 'my_bookings', to: 'bookings#my_bookings', as: :my_bookings

end
