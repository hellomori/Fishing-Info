Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, except: :index
  resources :users, only: :show
end
