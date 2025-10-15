Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  
  # Mockups routes - organized by user journey
  scope '/mockups' do
    # Landing page
    get '/', to: 'mockups#index', as: :mockups_root
    
    # Authentication routes
    get 'connexion', to: 'mockups/auth#new', as: :mockups_login
    post 'connexion', to: 'mockups/auth#create'
    delete 'deconnexion', to: 'mockups/auth#destroy', as: :mockups_logout
    
    # Password reset routes
    get 'mot-de-passe-oublie', to: 'mockups/passwords#new', as: :mockups_forgot_password
    post 'mot-de-passe-oublie', to: 'mockups/passwords#create'
    get 'reinitialiser/:token', to: 'mockups/passwords#edit', as: :mockups_reset_password
    patch 'reinitialiser/:token', to: 'mockups/passwords#update'

    # Commercial (Sales Rep) namespace
    namespace :commercial, path: 'commercial' do
      get 'tableau-de-bord', to: 'dashboard#index', as: :dashboard
      
      resources :appels, path: 'appels' do
        member do
          get 'analyse'
          get 'transcription'
        end
      end
      
      get 'progression', to: 'progress#index', as: :progress
      
      get 'profil', to: 'profile#show', as: :profil
      get 'profil/editer', to: 'profile#edit', as: :edit_profil
      patch 'profil', to: 'profile#update'
      
      get 'parametres', to: 'settings#index', as: :parametres
      patch 'parametres', to: 'settings#update'
    end
    
    # Manager namespace
    namespace :manager, path: 'manager' do
      get 'tableau-de-bord', to: 'dashboard#index', as: :dashboard
      
      get 'equipe', to: 'team#show', as: :equipe
      get 'equipe/membres', to: 'team#members', as: :equipe_membres
      get 'equipe/membres/:id', to: 'team#member', as: :equipe_membre
      
      resources :appels, only: [:index, :show] do
        member do
          get 'analyse'
        end
      end
      
      get 'membres/:id/appels', to: 'members#calls', as: :membre_appels
      
      get 'analyses', to: 'analytics#index', as: :analyses
      get 'analyses/comparaison', to: 'analytics#comparison', as: :analyses_comparaison
      get 'analyses/criteres', to: 'analytics#criteria', as: :analyses_criteres
      
      get 'profil', to: 'profile#show', as: :profil
      get 'profil/editer', to: 'profile#edit', as: :edit_profil
      patch 'profil', to: 'profile#update'
      
      get 'parametres', to: 'settings#index', as: :parametres
      patch 'parametres', to: 'settings#update'
    end
    
    # Admin namespace
    namespace :admin, path: 'admin' do
      get 'tableau-de-bord', to: 'dashboard#index', as: :dashboard
      
      # Users management
      resources :utilisateurs
      
      # Teams management
      resources :equipes
      
      # Criteria configuration
      resources :criteres do
        collection do
          patch 'ordre', to: 'criteria#reorder'
        end
      end
      
      # Platform settings
      get 'parametres', to: 'settings#index', as: :parametres
      patch 'parametres', to: 'settings#update'
      get 'parametres/api', to: 'settings#api', as: :parametres_api
      patch 'parametres/api', to: 'settings#update_api'
      
      # Analytics
      get 'analyses', to: 'analytics#index', as: :analyses
      get 'analyses/utilisation', to: 'analytics#usage', as: :analyses_utilisation
      get 'analyses/performance', to: 'analytics#performance', as: :analyses_performance
      
      # All calls
      resources :appels, only: [:index, :show, :destroy]
    end
    
    # Common routes
    resources :notifications, only: [:index], controller: 'mockups/notifications' do
      member do
        patch 'lu', to: 'mockups/notifications#mark_read'
      end
      collection do
        patch 'tout-lu', to: 'mockups/notifications#mark_all_read'
      end
    end
  end
  
  # Old mockup routes
  get 'mockups/index'
  get 'mockups/user_dashboard'
  get 'mockups/user_profile'
  get 'mockups/user_settings'
  get 'mockups/admin_dashboard'
  get 'mockups/admin_users'
  get 'mockups/admin_analytics'
  
  get "up" => "rails/health#show", as: :rails_health_check
  root "mockups#index"
end
