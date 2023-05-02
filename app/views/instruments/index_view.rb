# frozen_string_literal: true

class Instruments::IndexView < ApplicationView

  def initialize(instruments)
    @instruments = instruments
  end

  def template
    h1(class: 'font-bold text-4xl text-blue-500') { "Instruments " }

    render TableComponent.new(items: @instruments) do |table|
      table.column("Id") { _1.id }
      table.column("Name") { _1.name }
    end
  end
end