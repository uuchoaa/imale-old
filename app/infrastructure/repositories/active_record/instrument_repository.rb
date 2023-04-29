# typed: strict

module Infrastructure
  module Repositories
    module ActiveRecord
      class InstrumentRepository

        def create(instrument)
          instrument_record = InstrumentRecord.create!(instrument.attributes)
          instrument.id = instrument_record.id
          instrument
        end

        def find(id)
          instrument_record = InstrumentRecord.find_by(id: id)
          return nil if instrument_record.nil?

          Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
        end

        def all
          InstrumentRecord.all.map do |instrument_record|
            Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
          end
        end

        def delete(id)
          instrument_record = InstrumentRecord.find_by(id: id)
          return nil if instrument_record.nil?

          instrument_record.destroy
          Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
        end

        def update(instrument, attributes)
          instrument_record = InstrumentRecord.find(instrument.id)
          instrument_record.update!(attributes)

          Domain::Entities::Instrument.new(instrument_record.attributes.symbolize_keys)
        end
      end

    end
  end
end
