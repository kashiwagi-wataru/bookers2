Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:show,:index,:edit,:update]

  
  resources :books do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :tags
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
end
