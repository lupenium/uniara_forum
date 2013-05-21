UniaraForum::Application.routes.draw do
  devise_for :users
  resources :categories
  resources :posts do
    resources :replies
  end
  resources :replies
  root to: "pages#home"
end
