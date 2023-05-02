module Entities
  class Instrument
    include ActiveModel::Validations

    attr_accessor :id
    attr_accessor :name

    validates :name, presence: true, length: { maximum: 100 }

    def initialize(name: )
      @name = name

      begin
        validate!
      rescue ActiveModel::ValidationError => e
        raise Errors::ValidationError, e.message
      end
    end

    def attributes
      { name: @name }
    end

  end
end