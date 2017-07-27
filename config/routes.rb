Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
  root to: "home#index"
  resources :users
  resources :users, param: :username, only: [:show] do
    resource :follow, only: [:create, :destroy]
  end
  resources :tweets
end
