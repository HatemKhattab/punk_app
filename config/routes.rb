Rails.application.routes.draw do
  root "home#index"

  resources :home, only: [:show, :index]
  get '/search', to: "home#search"
end
