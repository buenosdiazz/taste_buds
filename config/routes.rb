Rails.application.routes.draw do
  resources :follows
  devise_for :users, controllers: { registrations: "registrations" }
  
  resources :lists

  get '/', to: 'welcome#home'

  get '/show', to: 'welcome#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'users#show'

  match 'follow', to: 'follows#follow', via: :post

  match 'unfollow', to: 'follows#unfollow', via: :delete
end
