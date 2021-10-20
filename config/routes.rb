Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  resources :cards, only: [:new, :create]
end
