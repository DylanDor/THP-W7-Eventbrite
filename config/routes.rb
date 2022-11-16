Rails.application.routes.draw do
  devise_for :users
  
  resources :events

  resources :users do
    resources :avatars, only: [:create]
  end

  root 'events#index'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  namespace :admin do
    resources :events
    resources :users
    root 'admin#index'
  end
end
