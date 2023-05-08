class InstrumentsController < ApplicationController

  def index
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    active_menu :instruments
    render Instruments::IndexView.new(instruments: instruments, menu_items: menu_items)
  end

end