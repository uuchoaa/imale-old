# frozen_string_literal: true

class Instruments::IndexView < ApplicationComponent

  def initialize(instruments:)
    @instruments = instruments
    # @menu_items = menu_items
  end

  def template
    
    # hero text: "Instruments"
    render TableComponent.new(items: @instruments) do |table|
      table.column("Id") { _1.id }
      table.column("Name") { _1.name }
    end
  end
end
