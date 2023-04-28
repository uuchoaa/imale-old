# typed: strict

module Infrastructure
  module Repositories
    module ActiveRecord

      class InstrumentRepository
        include Domain::Repositories::InstrumentRepository
        extend T::Sig

        sig { params(instrument: Domain::Entities::Instrument).returns(Domain::Entities::Instrument) }
        def create(instrument)
          instrument_record = InstrumentRecord.create!(instrument.attributes)
          instrument.id = instrument_record.id
          instrument
        end

        sig { params(id: Integer).returns(T.nilable(Domain::Entities::Instrument)) }
        def find(id)
          instrument_record = InstrumentRecord.find_by(id: id)
          return nil if instrument_record.nil?

          Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
        end

        sig { returns(T::Array[Domain::Entities::Instrument]) }
        def all
          InstrumentRecord.all.map do |instrument_record|
            Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
          end
        end

        sig { params(id: Integer).returns(T.nilable(Domain::Entities::Instrument)) }
        def delete(id)
          instrument_record = InstrumentRecord.find_by(id: id)
          return nil if instrument_record.nil?

          instrument_record.destroy
          Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
        end

        sig { params(instrument: Domain::Entities::Instrument, attributes: T::Hash[Symbol, T.untyped]).returns(Domain::Entities::Instrument) }
        def update(instrument, attributes)
          instrument_record = InstrumentRecord.find(instrument.id)
          instrument_record.update!(attributes)

          Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
        end
      end

    end
  end
end
