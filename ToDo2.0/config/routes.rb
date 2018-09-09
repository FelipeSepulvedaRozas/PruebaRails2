Rails.application.routes.draw do
  get 'completeds/create'
  get 'todo/index'
  devise_for :users

  resources :todo,only: [:index, :show] do
  	resources :completeds, only: [:create, :update,]
  end
  resources :completeds, only: :index
  root to: 'todo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
