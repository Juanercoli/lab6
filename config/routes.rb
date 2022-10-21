Rails.application.routes.draw do
  resources :monsters
  resources :tweets, only: [:index, :new, :create, :show]

  root "tweets#index"
end
