# frozen_string_literal: true

class Instruments::IndexView < ApplicationComponent

  class ActionButton < Phlex::HTML
    def template
      button( type: "button", class: "block rounded-full bg-indigo-600 p-1 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600" ) do 
        svg(
          xmlns: "http://www.w3.org/2000/svg",
          fill: "none",
          viewbox: "0 0 24 24",
          stroke_width: "1.5",
          stroke: "currentColor",
          class: "w-6 h-6"
        ) do |s|
          s.path(stroke_linecap: "round", stroke_linejoin: "round", d: "M12 6v12m6-6H6")
        end
      end
    end
  end

  class Hero < Phlex::HTML

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

  class Header < Phlex::HTML
    def initialize(title:, subtitle:)
      @title = title
      @subtitle = subtitle
    end

    def template
      div(class: "sm:flex sm:items-center") do
        render Hero.new(title: @title, subtitle: @subtitle)

        # div(class: "mt-4 sm:ml-16 sm:mt-0 sm:flex-none") do
        #   render ActionButton.new
        # end
      end
    end
  end

  class Body < Phlex::HTML
    def initialize(collection:)
      @collection = collection
    end

    def template
      div(class: "mt-8 flow-root") do
        div(class: "-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8") do
          div(class: "inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8") do
            render Grid.new(collection: @collection)
          end
        end
      end
    end

  end

  class Grid < Phlex::HTML
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

  def initialize(instruments:)
    @instruments = instruments
  end

  def template

    render Header.new(
      title: 'Naipes', 
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    )

    render Body.new(collection: @instruments)
  end
end
