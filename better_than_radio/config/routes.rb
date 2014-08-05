Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :profile, only: [:edit, :update]
  resource :create_account, only: [:show]
  resources :venues, only: [:new, :create]
  resources :artists, only: [:new, :create]
  resources :fans, only: [:new, :create]

  root to: "dashboards#show"
end
