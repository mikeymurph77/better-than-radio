Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :profile, only: [:edit, :update]
  resource :create_account, only: [:show]
  resources :venues, only: [:show, :new, :create]
  resources :artists, only: [:show, :new, :create]
  resources :fans, only: [:new, :create]
  resources :concerts, only: [:show, :new, :create]

  resource :fan_dashboard, only: [:show]
  resource :artist_dashboard, only: [:show]
  resource :venue_dashboard, only: [:show]

  root to: "sessions#new"
end
