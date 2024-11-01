Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'profile', to: 'profiles#show', as: :profile
  get 'profile/edit', to: 'profiles#edit', as: :edit_profile
  patch 'profile', to: 'profiles#update'

  resources :projects do
    member do
      post :invite # Route for inviting users
      get :accept_invite # Route for accepting invitations
    end
    resources :tasks
    resources :faqs
  end
  root "application#home"
  resources :notifications do
    member do
      post 'read'  # This creates a POST route for marking notifications as read
    end
  end
end
