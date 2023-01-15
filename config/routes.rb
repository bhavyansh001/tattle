Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :articles do
    resources :comments
  end
  get '/admin', to: 'admin#index', as: 'admin_page'

  get 'chat/show', as: 'chats'
end
