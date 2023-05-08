class InstrumentsController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    render Instruments::IndexView.new(instruments: instruments, menu_items: menu_items)
  end

end