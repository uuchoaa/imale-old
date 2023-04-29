module UseCases
  class ListInstruments

    def initialize(repository)
      @repository = repository
    end

    def call
      @repository.all
    end
  end
end
