Rails.application.routes.draw do
  root "hello#index"

  resources :instruments, only: :index
end
