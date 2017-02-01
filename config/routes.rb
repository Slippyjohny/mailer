require 'sidekiq/web'

Rails.application.routes.draw do
  resources :notifications
  devise_for :users, controllers: {registrations: "registrations"}

  resources :events do
    resources :comments, only: [:new, :create, :destroy]
    resources :documents, only: [:show, :create, :new, :destroy]
    resources :invites, only: [:new, :create]
  end
  resources :notifications, only: %i{index show}
  root 'events#index'
  mount Sidekiq::Web, at: '/sidekiq'
  mount ActionCable.server => '/cable'

end
