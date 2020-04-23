Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'

  resources :post_images
  resources :users, only: [:index,:show,:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
