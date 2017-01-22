Rails.application.routes.draw do

  get "/recipes" => "recipes#index"

  get "/recipes/new" => "recipes#new"

  post "/recipes" => "recipes#create"

  get "/recipes/:id" => "recipes#show"

  get "/recipes/:id/edit" => "recipes#edit"

  patch "/recipes/:id" => "recipes#update"
  
end