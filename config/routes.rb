Rails.application.routes.draw do

  get 'home/index'
  get 'home/secret'
  get 'users/secret'
  devise_for :user, controllers: { registrations: "registrations" }

  resources :charges, only: [:new, :create]
  resources :events do 
  	resources :attendances
  end
  resources :user, except: [:new, :create, :destroy, :index]
  root "home#index"
end