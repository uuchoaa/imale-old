class ApplicationController < ActionController::Base

  protected

  def active_menu(item)
    @active_menu_item = item
  end

  def menu_items
    generate_menu_items(@active_menu_item)
  end

  def generate_menu_items(active_item)
    [
      OpenStruct.new(active?: active_item == :home, path: root_path, label: 'Início', icon: '...'),
      OpenStruct.new(active?: active_item == :instruments, path: instruments_path, label: 'Naipes', icon: '...')
    ]
  end
end
