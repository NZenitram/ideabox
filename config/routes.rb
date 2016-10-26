Rails.application.routes.draw do
  resources :categories do
    resources :ideas, only: [:index, :show, :destroy, :edit, :update]
  end

  resources :ideas, only: [:new, :create]

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: "sessions#destroy"

end
