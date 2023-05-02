class InstrumentsController < ApplicationController
  layout -> { ApplicationLayout }

  # active_menu :dash

  def index
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    menu_items = [
      OpenStruct.new(active: false, path: '/', label: 'Home', icon: '...'),
      OpenStruct.new(active: false, path: '/dash', label: 'Dash', icon: '...'),
      OpenStruct.new(active: true, path: '/rafael', label: 'Rafa', icon: '...'),
    ]

    render Instruments::IndexView.new(instruments: instruments, menu_items: menu_items)
  end

end