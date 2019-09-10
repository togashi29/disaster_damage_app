Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users
  resources :users
  resources :damages
end
