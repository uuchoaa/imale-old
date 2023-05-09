class ManagementController < ApplicationController

  def instruments
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    active_menu :management

    # render Management::IndexView.new(menu_items: menu_items, main_area: Instruments::IndexView.new(instruments: instruments) )
    view = Management::IndexView.new(menu_items: menu_items) do |view|
      view.main_area component: Instruments::IndexView.new(instruments: instruments)
      view.active_menu :instruments
    end
    render view
  end
  
  def class_terms
    # use_case = UseCases...
    # data = use_case.call
    # ...

    active_menu :management
    render Management::IndexView.new(
      menu_items: menu_items, 
      main_area: LogoComponent.new,
      active_menu: :class_terms
    )
  end
end