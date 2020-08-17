Rails.application.routes.draw do
  get '/hi', to: 'first#hi'
  get '/me', to: 'users#me'
  delete '/sessions', to: 'sessions#destroy'

  resources :users
  resources :records
  resources :tags
  resources :taggings, except: [:update]
  resources :sessions, only: [:create]
end
