Rails.application.routes.draw do

  patch 'tweets/:id' => 'tweets#update'
  get 'tweets/:id/edit' => 'tweets#edit', as:'edit_tweet'


  get 'maps/index'
  get 'maps///maps'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :maps, only: [:index]

  get 'index2' => 'tweets#index2'

root "tweets#index"  


  
end

