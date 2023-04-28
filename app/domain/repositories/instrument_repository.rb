# typed: strict

module Domain
  module Repositories
    module InstrumentRepository
      extend T::Sig
      extend T::Helpers
      interface!

      sig { params(instrument: Domain::Entities::Instrument).returns(Domain::Entities::Instrument) }
      def create(instrument)
      end

      sig { params(id: Integer).returns(T.nilable(Domain::Entities::Instrument)) }
      def find(id)
      end

      sig { returns(T::Array[Domain::Entities::Instrument]) }
      def all
      end

      sig { params(id: Integer).returns(T.nilable(Domain::Entities::Instrument)) }
      def delete(id)
      end

      sig { params(instrument: Domain::Entities::Instrument, attributes: T::Hash[Symbol, T.untyped]).returns(Domain::Entities::Instrument) }
      def update(instrument, attributes)
      end
    end
  end
end
