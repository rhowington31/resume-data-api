Rails.application.routes.draw do
  get "/students" => "students#index"
  get "/students/:id" => "students#show"
  post "/students" => "students#create"
  patch "/students/:id" => "students#update"
  delete "/students/:id" => "students#destroy"

  post "/users" => "users#create"

  get "/experiences" => "experiences#index"
  post "/experiences" => "experiences#create"
  patch "/experiences" => "experiences#update"
  delete "/experiences" => "experiences#destroy"

  post "/sessions" => "sessions#create"
end
