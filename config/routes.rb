Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show" 
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/suppliers" => "suppliers#index"
    post "/suppliers" => "suppliers#create"
    get "/suppliers/:id" => "suppliers#show" 
    patch "/suppliers/:id" => "suppliers#update"
    delete "/suppliers/:id" => "suppliers#destroy"
  
    get "/users" => "users#index"
    post "/users" => "users#create"
    delete "/users/:id" => "users#destroy"
    post "/sessions" => "sessions#create"
    
    get "/orders" => "orders#index"
    post "/orders" => "orders#create"  
  end

end
