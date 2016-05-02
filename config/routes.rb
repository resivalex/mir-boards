Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  root to: 'visitors#index'

  devise_for :users

  resources :nominations, only: :index

  resources :riders, only: [:index, :show]
end
