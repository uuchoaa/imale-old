Rails.application.routes.draw do
  root "hello#index"

  get '/cadastros', to: 'management#index'
end
