Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  resources :articles do
    resources :comments
  end
  get '/hello_this_is_admin/admin/index', to: 'admin#index', as: 'admin_page'
end
