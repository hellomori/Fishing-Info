Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, except: :index do
    resources :comments, only: :create
    collection do
      get "search", "seabass", "eging", "ajing", "shore_jigging", "bass", "wind", "enjoy", "osaka", "wakayama", "kyoto", "hyogos", "hyogon", "awaji"
    end
  end
  resources :users, only: :show
  resources :cookings
  resources :chats, only: [:index, :create]
end

