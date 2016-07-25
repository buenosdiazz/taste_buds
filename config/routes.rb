Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  
  resources :tables

  get '/', to: 'welcome#home'

  get '/show', to: 'welcome#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'users#show'
end
