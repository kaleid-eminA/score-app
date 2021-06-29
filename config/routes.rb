Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :scores 
  resources :top, only:[:index]
  resources :rankings, only:[:index]
end
