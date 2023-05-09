class ApplicationController < ActionController::Base
  layout -> { ApplicationLayout }

  protected

  def active_menu(item)
    @active_menu_item = item
  end

  def menu_items
    generate_menu_items(@active_menu_item)
  end

  def generate_menu_items(active_item)
    [
      MenuItemPresenter.new(active: active_item == :home, path: '/', label: 'Início', icon: '...'),
      MenuItemPresenter.new(active: active_item == :management, path: '/cadastros/naipes', label: 'Cadastros', icon: '...')
    ]
  end
end
