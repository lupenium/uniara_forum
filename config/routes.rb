UniaraForum::Application.routes.draw do
  devise_for :users
  resources :categories
  resources :posts
  resources :replies
  root to: "pages#home"
end
