# frozen_string_literal: true

class Hello::IndexView < ApplicationView

  def initialize(menu_items:)
    @menu_items = menu_items
  end

  def template
    hero text: "Início"
  end
end
