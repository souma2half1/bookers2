Rails.application.routes.draw do

  root to:'homes#top'
  get  'home/about' =>'homes#about' ,as: 'homes_about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :index, :update]
 end
