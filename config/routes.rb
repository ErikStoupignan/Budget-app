Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'splash#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

  resources :groups do
    resources :movements
  end
end
