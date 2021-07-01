Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :scores 
  resources :top, only:[:index]
  resources :rankings, only:[:index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts, only: [:new, :create]

end
