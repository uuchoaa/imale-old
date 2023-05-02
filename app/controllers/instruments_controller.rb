class InstrumentsController < ApplicationController
  def index
    repository = Repositories::ActiveRecord::InstrumentRepository.new
    use_case = UseCases::ListInstruments.new(repository)
    @instruments = use_case.call

    render json: @instruments
  end
end