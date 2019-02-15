Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :attendances
      resources :events

      root to: "users#index"
    end
  devise_for :user, controllers: { registrations: "registrations" }

  resources :charges, only: [:new, :create]
  resources :events do 
  	resources :attendances
  end
  resources :user, except: [:new, :create, :destroy, :index]
  root to: "events#index"
end