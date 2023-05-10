# frozen_string_literal: true

class Instruments::IndexView < ApplicationComponent

  def initialize(instruments:)
    @instruments = instruments
  end

  def template

    render Management::Header.new(
      title: 'Naipes', 
      action_button: true # TODO: NavMenuItem.new(...) 
    )
    # TODO: Refactor: NavMenuItem virar Link

    render Management::Body.new(collection: @instruments)
  end
end
