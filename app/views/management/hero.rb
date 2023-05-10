class Management::Hero < Phlex::HTML

  def initialize(title:, subtitle:)
    @title = title
    @subtitle = subtitle
  end

  def template
    div(class: "sm:flex-auto") do
      h1(class: "text-base font-semibold leading-6 text-gray-900") { @title }
      p(class: "mt-2 text-sm text-gray-700") { @subtitle } 
    end
  end
end