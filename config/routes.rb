require 'resque/server'

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:create]

  post "users/admin_create", to: "users#create"
  get "users/:id/new_avatar", to: "users#new_avatar"

  resources :todo_lists, only: [:index, :show, :create] do
    resources :todo_items
  end

  mount Resque::Server, at: '/jobs'
end
