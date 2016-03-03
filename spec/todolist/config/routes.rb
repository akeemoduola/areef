TodoApplication.routes.draw do
  root "pages#index"
  get "/todo", to: "todolist#index"
  get "/todo/new", to: "todolist#new"
  get "/todo/:id/edit", to: "todolist#edit"
  get "/todo/:id", to: "todolist#show"
  post "/todo/:id", to: "todolist#create"
  put "/todo/:id", to: "todolist#update"
  patch "/todo/:id", to: "todolist#update"
  delete "/todo/:id", to: "todolist#destroy"

end
