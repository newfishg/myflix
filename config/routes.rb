Myflix::Application.routes.draw do
  root to: 'pages#front'

  get 'ui(/:action)', controller: 'ui'

  get 'home', to: 'videos#index'

  resources :videos, only: [:show] do
    collection do
      get 'search', to: 'videos#search'
    end
  end

  get 'category/:id', to: 'categories#show'
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  resources :users, only: [:create]

end
