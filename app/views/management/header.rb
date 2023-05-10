class Management::Header < Phlex::HTML
  def initialize(title:, **props)
    @title = title
    @subtitle, @action_button = props.values_at(:subtitle, :action_button)
  end

  def template
    div(class: "sm:flex sm:items-center") do
      render Management::Hero.new(title: @title, subtitle: @subtitle)

      if @action_button
        div(class: "mt-4 sm:ml-16 sm:mt-0 sm:flex-none") { render Management::ActionButton.new }
      end

    end
  end
end
