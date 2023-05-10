class Management::Body < Phlex::HTML
  def initialize(collection:)
    @collection = collection
  end

  def template
    div(class: "mt-8 flow-root") do
      div(class: "-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8") do
        div(class: "inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8") do
          render Management::Grid.new(collection: @collection)
        end
      end
    end
  end

end

