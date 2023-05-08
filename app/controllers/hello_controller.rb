class HelloController < ApplicationController

  def index
    active_menu :home
    render Hello::IndexView.new(menu_items: menu_items)
  end
end
