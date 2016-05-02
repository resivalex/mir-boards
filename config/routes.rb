Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  root to: 'visitors#index'

  devise_for :users

  resources :nominations, only: [:index, :show]

  resources :riders, only: [:index, :show]

  resources :events, only: [:index, :show]
end
