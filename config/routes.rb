Rails.application.routes.draw do
  devise_for :users

  root 'splash#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :group_movements
  resources :groups
  resources :movements
  resources :users
end
