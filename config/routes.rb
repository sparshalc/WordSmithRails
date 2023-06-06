Rails.application.routes.draw do
  get 'about/us'
  resources :user, only: [:show]
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
  root 'home#index'
  resources :blogs do 
    resources :comments
  end
end