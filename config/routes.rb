Rails.application.routes.draw do
  root to: "home#index"

  resources :users, only: [:new, :create, :update, :edit, :show]

  get "/signup" => "user#new"
end
