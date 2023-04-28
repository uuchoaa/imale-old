# typed: strict
module Application
  module UseCases
    class ListInstruments
      extend T::Sig

      sig { params(repository: Domain::Repositories::InstrumentRepository).void }
      def initialize(repository)
        @repository = T.let(repository, Domain::Repositories::InstrumentRepository)
      end

      sig { returns(T::Array[Domain::Entities::Instrument]) }
      def call
        @repository.all
      end
    end
  end
end
