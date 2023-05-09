class ManagementController < ApplicationController
  
  def instruments
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    active_menu :management
    render Management::IndexView.new(menu_items: menu_items, main_area: Instruments::IndexView.new(instruments: instruments) )
  end
  
  def class_terms
    # use_case = UseCases...
    # data = use_case.call
    # ...

    active_menu :management
    render Management::IndexView.new(menu_items: menu_items, main_area: LogoComponent.new)
  end
end