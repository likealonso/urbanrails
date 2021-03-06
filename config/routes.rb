Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#show', page: 'home'
  get 'pages/:page', to: 'pages#show'
  resources :users, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :words do
    resources :definitions, except: [:new, :show, :index], shallow: true
  end
  get '/login', to: 'sessions#new'
  get '/search', to: 'words#search'
  post '/random', to: 'words#random'
  
end

# root 'users#index'
# resources :users do
# resources :words, shallow: true do
# resources :definitions
# end
# end
# get '/login', to: 'sessions#new'
