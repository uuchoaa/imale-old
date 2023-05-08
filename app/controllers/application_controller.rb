class ApplicationController < ActionController::Base

  protected def menu_items
    #TODO: move labels to I18n
    #TODO: fix mobile menu
    [
      OpenStruct.new(active?: false, path: root_path, label: 'Início', icon: '...'),
      OpenStruct.new(active?: false, path: instruments_path, label: 'Naipes', icon: '...'), 
    ]
  end

end
