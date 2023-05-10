class Instruments::FormView < ApplicationView
  def initialize(instrument:)
    @instrument = instrument
  end

  def template
    render Management::Header.new(
      title: 'Adicionar novo', 
      subtitle: 'Preencha os campos e clique em salvar'
    )
  end
end