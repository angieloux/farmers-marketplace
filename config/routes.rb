Rails.application.routes.draw do

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    end

  devise_for :users
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "listings#index"
end
