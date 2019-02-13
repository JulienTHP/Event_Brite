Rails.application.routes.draw do

  get 'users/secret'
  devise_for :user, controllers: { registrations: "registrations" }

  resources :events
  resources :user, except: [:new, :create, :destroy, :index]
  root "events#index"
end