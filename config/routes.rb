Rails.application.routes.draw do
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/students" => "students#index"
  get "/students/:id" => "students#show"
  post "/students" => "students#create"
  patch "/students/:id" => "students#update"
  delete "/students/:id" => "students#destroy"

  get "/experiences" => "experiences#index"
  post "/experiences" => "experiences#create"
  patch "/experiences" => "experiences#update"
  delete "/experiences" => "experiences#destroy"

  post "/sessions" => "sessions#create"

  post "/capstones" => "capstones#create"
  get "/capstones" => "capstones#index"
  get "/capstones/:id" => "capstones#show"
  post "/capstones" => "capstones#create"
  patch "/capstones/:id" => "capstones#update"
  delete "/capstones/:id" => "capstones#destroy"

  

end
