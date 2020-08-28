Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :destroy]
  resources :blogs, only: [:index, :new, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  root "users#new"
end
