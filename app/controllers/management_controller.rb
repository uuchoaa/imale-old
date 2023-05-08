class ManagementController < ApplicationController
  
  def index
    active_menu :management
    render Management::IndexView.new(menu_items: menu_items)
  end
end