Rails.application.routes.draw do
  get 'todo/index'
  devise_for :users

  resources :todo,only: :index
    root to: 'todo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
