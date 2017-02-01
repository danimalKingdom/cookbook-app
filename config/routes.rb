Rails.application.routes.draw do

  get "/recipes" => "recipes#index"

  post "/search" => "recipes#search"

  get "/recipes/new" => "recipes#new"

  post "/recipes" => "recipes#create"

  get "/recipes/:id" => "recipes#show"

  get "/recipes/:id/edit" => "recipes#edit"

  patch "/recipes/:id" => "recipes#update"

  delete "recipes/:id" => "recipes#destroy"

  get '/signup' => 'users#new'

  post '/users' => 'users#create'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  
end
