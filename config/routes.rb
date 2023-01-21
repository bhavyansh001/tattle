Rails.application.routes.draw do
  get 'users/show'
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :articles do
    resources :comments
  end
  get '/admin', to: 'admin#index', as: 'admin_page'
  get '/admin/:id', to: 'admin#show', as: 'admin_show'

  resources :rooms do
    resources :messages
  end
  get 'user/:id', to: 'users#show', as: 'user'
end
