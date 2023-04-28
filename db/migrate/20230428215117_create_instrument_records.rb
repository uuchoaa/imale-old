class CreateInstrumentRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_records do |t|
      t.string :name

      t.timestamps
    end
  end
end
