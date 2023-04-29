module Repositories
  module InstrumentRepositoryInterface

    def create(instrument)
      raise 'Should be implemented by subclasses'
    end

    def find(id)
      raise 'Should be implemented by subclasses'
    end

    def all
      raise 'Should be implemented by subclasses'
    end

    def delete(id)
      raise 'Should be implemented by subclasses'
    end

    def update(instrument, attributes)
      raise 'Should be implemented by subclasses'
    end
  end
end
