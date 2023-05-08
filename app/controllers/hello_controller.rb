class HelloController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    render Hello::IndexView.new(menu_items: menu_items)
  end
end
