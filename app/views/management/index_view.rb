class Management::IndexView < ApplicationView

  def initialize(menu_items:)
    @menu_items = menu_items
  end

  def template(&block)
    hero text: 'Cadastros'

    h1 { "uhuuu" }
  end
  
end