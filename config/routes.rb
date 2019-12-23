Rails.application.routes.draw do

	root "root#top"

	get "home/about" => "root#about"

  devise_for :users

  resources :books, onry: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show, :edit, :update, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
