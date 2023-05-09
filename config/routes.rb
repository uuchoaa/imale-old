Rails.application.routes.draw do
  root "hello#index"

  get '/cadastros/naipes', to: 'management#instruments'
  get '/cadastros/turmas', to: 'management#class_terms'
end
