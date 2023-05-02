module Entities
  class Instrument
    include ActiveModel::Validations

    attr_accessor :id
    attr_accessor :name

    validates :name, presence: true, length: { maximum: 100 }

    def initialize(name:, id: nil)
      @name = name

      if not id.nil?
        @id = id
      end

      begin
        validate!
      rescue ActiveModel::ValidationError => e
        raise Errors::ValidationError, e.message
      end
    end

    def attributes
      { name: @name }
    end

    def as_json(args={})
      attributes.merge({ id: @id })
    end

  end
end