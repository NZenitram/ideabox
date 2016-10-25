Rails.application.routes.draw do
  resources :categories do
    resources :ideas, only: [:index, :show]
  end

  resources :ideas, only: [:new, :create]

end
