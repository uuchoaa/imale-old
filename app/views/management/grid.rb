class Management::Grid < Phlex::HTML
  def initialize(collection:)
    @collection = collection
  end

  def template
    div(class: "grid grid-rows-1 xl:grid-cols-2 gap-2") do

      @collection.each do |item|
        div(class: "relative flex items-center space-x-3 rounded-lg border border-gray-300 bg-white px-4 py-3 shadow-sm focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 hover:border-gray-400" ) do
          div(class: "flex-shrink-0") do
            span( class: "inline-flex h-8 w-8 items-center justify-center rounded-full bg-gray-400" ) { span(class: "text-sm font-medium leading-none text-white") { item.name[0] } }
          end

          div(class: "min-w-0 flex-1") do
            a(href: "#", class: "focus:outline-none") do
              span(class: "absolute inset-0", aria_hidden: "true")
              p(class: "text-sm font-medium text-gray-900") { item.name }
            end
          end
        end
      end

    end
  end
end

