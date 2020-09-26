Rails.application.routes.draw do
  resources :posts
  resources :tags

  devise_for :users
  root 'posts#index'
  get 'about', to: "pages#about"


end
