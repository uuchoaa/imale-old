module UseCases
  class CreateInstrument
    
    def initialize(repository)
      @repository = repository
    end

    def call(name:)
      instrument = Entities::Instrument.new(name: name)
      @repository.create(instrument)
    end
  end
end