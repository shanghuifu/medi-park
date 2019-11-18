Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles, only: [:index, :new, :create, :destroy, :show]
end
