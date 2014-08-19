Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :search, only: [:show]
  resource :profile, only: [:edit, :update]
  resource :create_account, only: [:show]
  resources :venues, only: [:show, :new, :create, :edit, :update]
  resources :artists, only: [:show, :new, :create, :edit, :update]
  resources :fans, only: [:show, :new, :create, :edit, :update]
  
  resources :concerts, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :galleries, only: [:show]
    resources :photos, only: [:create]
    resource :rsvp, only: [:create, :destroy]
  end

  resources :photos, only: [:show, :destroy, :edit, :update]

  resource :fan_dashboard, only: [:show]
  resource :artist_dashboard, only: [:show]
  resource :venue_dashboard, only: [:show]

  root to: "sessions#new"
end
