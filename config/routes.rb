Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index]

end
