require "monban/constraints/signed_in"
require Rails.root.join("lib/fan_account_constraint")
require Rails.root.join("lib/artist_account_constraint")
require Rails.root.join("lib/venue_account_constraint")

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :profile, only: [:edit, :update]
  resource :create_account, only: [:show]
  resources :venues, only: [:new, :create]
  resources :artists, only: [:new, :create]
  resources :fans, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    constraints FanAccountConstraint.new do
      root to: "fan_dashboards#show", as: :fan_dashboards
    end

    constraints ArtistAccountConstraint.new do
      root to: "artist_dashboards#show", as: :artist_dashboards
    end

    constraints VenueAccountConstraint.new do
      root to: "venue_dashboards#show", as: :venue_dashboards
    end
  end

  root to: "sessions#new"
end
