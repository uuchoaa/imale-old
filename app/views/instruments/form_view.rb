class Instruments::FormView < ApplicationView
  include Phlex::Rails::Helpers::FormWith

  def initialize(instrument:, **props)
    @instrument = instrument
    @message = props.values_at(:message).first
  end

  def template
    render Management::Header.new(
      title: 'Adicionar novo', 
      subtitle: 'Preencha os campos e clique em salvar'
    )

    h1 { "UHUUUUU: #{@message}" }
    if @message
      h1 { "UHUUUUU" }
    end

    form_with url: '/cadastros/naipes', builder: ApplicationFormBuilder, data: { turbo: false } do |form|
      form.field :name, label: 'Nome'
      form.submit 'Salvar'
      
      # form.label :name, 'Nome'
      # form.text_field :name

      # form.check_box :pet_dog
      # form.label :pet_dog, "I own a dog"

      # form.check_box :pet_cat
      # form.label :pet_cat, "I own a cat"

      # form.label :age, 'Are you an adult?'
      # form.radio_button :age, "child"
      # form.label :age_child, "I am younger than 21"
      # form.radio_button :age, "adult"
      # form.label :age_adult, "I am over 21"

      # form.label :message, 'Text area input'
      # form.text_area :message, size: "70x5"
      # form.hidden_field :parent_id, value: "foo"
      # form.label :password, 'Password'
      # form.password_field :password

      # form.number_field :price, in: 1.0..20.0, step: 0.5
      # form.range_field :discount, in: 1..100
      # form.date_field :born_on
      # form.time_field :started_at
      # form.datetime_local_field :graduation_day
      # form.month_field :birthday_month
      # form.week_field :birthday_week
      # form.search_field :name
      # form.email_field :address
      # form.telephone_field :phone
      # form.url_field :homepage
      # form.color_field :favorite_color

      # form.submit 'Salvar'
    end
  end
end