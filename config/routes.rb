Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :show] do
    member do
      post 'favorite', to: 'favorites#create'
      delete 'favorite', to: 'favorites#destroy'
      post 'bookmark', to: 'bookmarks#create'
      delete 'bookmark', to: 'bookmarks#destroy'
      post 'review', to: 'reviews#create'
    end
    collection do
      get 'search', to: 'books#search'
    end
  end

  get 'favorites', to: 'favorites#index'
  get 'bookmarks', to: 'bookmarks#index'

  root 'books#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
