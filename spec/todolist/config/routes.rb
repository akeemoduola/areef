TodoApplication.routes.draw do
  root "pages#index"
  resources :lists
end
