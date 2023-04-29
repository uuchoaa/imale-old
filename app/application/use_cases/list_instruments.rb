module Application
  module UseCases
    class ListInstruments

      def initialize(repository)
        @repository = T.let(repository, Domain::Repositories::InstrumentRepository)
      end

      def call
        @repository.all
      end
    end
  end
end
