Rails.application.routes.draw do
  root to: "home#index"

  resources :users, only: [:new, :create, :update, :edit, :show]

  get "/signup" => "users#new"


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete '/logout' => 'sessions#destroy'
end
