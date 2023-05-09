class ManagementController < ApplicationController
  
  def index
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    active_menu :management
    render Management::IndexView.new(menu_items: menu_items, instruments: instruments)
  end
end