Rails.application.routes.draw do
  #get 'password_resets/new'
  #get 'password_resets/edit'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do 
    member do
      get :following, :followers
    end
  end

  #get  'likes/show', to: 'likes#show'
  post 'microposts/share', to: 'microposts#share'
  post 'likes/show', to: 'likes#show'
  #get  'likes/show', to: 'likes#show'
  #get  'likes/show', to: 'microposts#likedby'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy] do 
      member do 
        get  :likedby
      end
    end

  resources :relationships,       only: [:create, :destroy]



  resource :likes, only: [:create, :destroy]
end
