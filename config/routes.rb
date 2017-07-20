Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get "users/:id/new_avatar", to: "users#new_avatar"
  patch "users/:id/update_avatar", to: "users#update"

  resources :todo_lists, only: [:index, :show] do
    resources :todo_items
  end
end
