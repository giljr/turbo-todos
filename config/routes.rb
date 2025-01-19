Rails.application.routes.draw do
  resources :todos
  root "todos#index" # add this line
end
