module Entities
  class Instrument
    attr_accessor :name

    def initialize(name: nil)
      @name = name
    end
  end
end
