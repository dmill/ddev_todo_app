Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :todo_lists, only: [:index, :show] do
    resources :todo_items
  end
end
