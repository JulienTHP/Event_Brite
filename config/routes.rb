Rails.application.routes.draw do

  get 'users/edit'
  get 'users/secret'
  get 'users/show'
  get 'home/index'
  get 'home/secret'
  get 'users/secret'
  devise_for :user, controllers: { registrations: "registrations" }

  resources :charges, only: [:new, :create]
  resources :events do 
  	resources :attendances
  end
  resources :user, except: [:new, :create, :destroy, :index]
  root "events#index"
end