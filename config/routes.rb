Rails.application.routes.draw do
  root 'events#index'
  resources :users do
    resources :events
  end
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
