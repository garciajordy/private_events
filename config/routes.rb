# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  resources :users
  resources :events do
  resources :invites
  end
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
