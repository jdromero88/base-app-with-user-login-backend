Rails.application.routes.draw do
  resources :posts
  resources :products
  resources :users
  post '/login', to: 'users#show'
  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
