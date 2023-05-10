Rails.application.routes.draw do
  root "hello#index"

  # TODO: refactor: user resource dentro de namespace e mover para InstrumentsController
  # TODO: refactor: usar helpers para geração de links (podemos mudar as rotas, talvez até mover para um arquivo externo, i18n...)
  get '/cadastros/naipes', to: 'management#instruments'
  get '/cadastros/naipes/novo', to: 'management#instruments_new'

  get '/cadastros/turmas', to: 'management#class_terms'
end
