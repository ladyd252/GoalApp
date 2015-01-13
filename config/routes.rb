Rails.application.routes.draw do
  root to: "sessions#new"
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :goal_comments, only: [:create]
  resources :user_comments, only: [:create]
end
