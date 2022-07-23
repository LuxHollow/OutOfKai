  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "oauth2callback", to:"calendar#callback"
  resources :events
  devise_for :users
  get "about-us", to: "about#index", as: :about

  get "calendar", to:"calendar#index"
  get "oauth2callback", to:"calendar#callback"

  get "timezone", to: "timezone#index"

  root to: "main#index"
end
