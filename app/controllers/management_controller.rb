class ManagementController < ApplicationController

  def instruments_create(**props)
    # repository = Repositories::ActiveRecord::InstrumentRepository.new
    # use_case = UseCases::CreateInstruments.new(repository)
    # success = use_case.call(
    #   name: params[:instrument].permit!(:name)
    # )

    success = true

    if success
      message = 'Salvo com sucesso!'
    else
      message = 'Erro ao salvar!'
    end

    render Instruments::FormView.new(instrument: {}, message: message)
  end

  def instruments_new
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    active_menu :management

    # render Management::IndexView.new(menu_items: menu_items, main_area: Instruments::IndexView.new(instruments: instruments) )
    view = Management::IndexView.new(menu_items: menu_items) do |view|
      view.active_menu :instruments
      view.main_area component: Instruments::IndexView.new(instruments: instruments)
      view.right_area component:  Instruments::FormView.new(instrument: {})
    end

    # render view
    render Instruments::FormView.new(instrument: {})
  end

  def instruments
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    instruments = use_case.call

    active_menu :management

    # render Management::IndexView.new(menu_items: menu_items, main_area: Instruments::IndexView.new(instruments: instruments) )
    view = Management::IndexView.new(menu_items: menu_items) do |view|
      view.active_menu :instruments
      view.main_area component: Instruments::IndexView.new(instruments: instruments)
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