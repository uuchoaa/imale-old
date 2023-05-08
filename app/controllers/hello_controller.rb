class HelloController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    active_menu :home
    render Hello::IndexView.new(menu_items: menu_items)
  end
end
