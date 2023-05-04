# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :chats
    root to: 'welcome#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
