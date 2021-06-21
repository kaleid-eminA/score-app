Rails.application.routes.draw do
  devise_for :users
  root to: "scores#index"
  resources :scores 
  resources :top, only:[:index]
end
