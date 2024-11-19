Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  # Routes pour l'authentification des utilisateurs
  devise_for :users

  # Routes pour les items
  resources :items do
    # Routes imbriquées pour les bookings sous les items
    resources :bookings, only: [:new, :create]

    # Route pour la liste des items du propriétaire (utilisateur connecté)
    collection do
      get 'owner', to: 'items#owner_index'
    end
  end

  # Routes pour les bookings (accès direct aux réservations)
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    # Routes pour la gestion des réservations en tant que propriétaire
    collection do
      get 'owner', to: 'bookings#owner_index'
    end
  end

  # Routes pour les recherches d'items
  get 'items/search', to: 'items#search', as: 'search_items'
end
end
