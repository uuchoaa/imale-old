# frozen_string_literal: true

class Instruments::IndexView < ApplicationView

  def initialize(instruments:, menu_items:)
    @instruments = instruments
    @menu_items = menu_items
  end

  def template
    
    hero text: "Instruments"
    render TableComponent.new(items: @instruments) do |table|
      table.column("Id") { _1.id }
      table.column("Name") { _1.name }
    end
  end
end
