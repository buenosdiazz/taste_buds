Rails.application.routes.draw do
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  
  resources :lists do 
  resources :items
  end  


  get '/', to: 'welcome#home'

  get '/show', to: 'welcome#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'users#show'

  match '/follow/:list_id', to: 'follows#follow', via: :post, as: "follow" 

  match '/unfollow/:list_id', to: 'follows#unfollow', via: :delete, as: 'unfollow'

  post "/lists/:list_id/items/add" => 'lists#additem'

end
