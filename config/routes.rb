Rails.application.routes.draw do
  resources :areas, only: :index
  resources :locations, only: [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
