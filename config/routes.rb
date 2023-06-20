Rails.application.routes.draw do
  get 'activity/logs'
  get 'activity/foryou'
  get 'about/us'
  post 'user/:id/follow', to: 'user#follow', as: 'follow'
  post 'user/:id/unfollow', to: 'user#unfollow', as: 'unfollow'
  post 'user/:id/accept', to: 'user#accept', as: 'accept'
  post 'user/:id/decline', to: 'user#decline', as: 'decline'
  post 'user/:id/cancel', to: 'user#cancel', as: 'cancel'

  get 'user/:id', to: 'user#show', as: 'user'
  
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
  root 'home#index'
  resources :blogs do 
    resources :comments
  end
end