class Management::IndexView < ApplicationView
  include Phlex::Rails::Helpers::LinkTo

  def initialize(menu_items:, main_area:)
    @menu_items = menu_items
    @main_area = main_area
  end

  def template(&block)
    hero text: 'Cadastros'

    div(class: "mx-auto w-full max-w-7xl grow flex xl:px-2") do

      div(class: "basis-52 border-gray-200 py-6 xl:w-36 xl:shrink-0 xl:border-b-0 xl:px-0 border-r") do 
        # h1 { "Left column area" }
        ul(role: "list", class: "space-y-2") do

          sidebar_menu = [
            MenuItemPresenter.new(active: true, path: '/cadastros/naipes', label: 'Naipes', icon: '...'),
            MenuItemPresenter.new(active: false, path: '/cadastros/turmas', label: 'Turmas', icon: '...'),
            MenuItemPresenter.new(active: false, path: '/cadastros/apresentacoes', label: 'Apresentações', icon: '...'),
          ]

          sidebar_menu.each do |menu_item|
            active_class = "flex justify-between gap-x-6 py-2 rounded-l-md pl-4 bg-gray-50 border-transparent -translate-y-0.5 scale-101 border-r-2 border-r-indigo-500"
            regular_class = "flex justify-between gap-x-6 py-2 cursor-pointer rounded-l-md pl-4 border-r-2 border-transparent hover:bg-gray-50  hover:-translate-y-0.5 hover:scale-101 hover:border-r-indigo-500 duration-300"

            render NavMenuItemComponent.new(
              item: menu_item, 
              active_class: active_class, 
              regular_class: regular_class
            )
          end

        end
      end

      div(class: "flex w-full") do
        div(class: "basis-1/2 px-4 py-6 sm:px-4 lg:pl-6 xl:flex-1 xl:pl-6") do
          # h1 { "Main area" }

          render @main_area

        end
        div( class: "basis-1/2 border-gray-200 px-4 py-6 sm:px-4 sm:border-l lg:border-t-0 lg:pr-8 xl:pr-6" ) do
          h1 { "Right column area" }
        end
      end
    end

  end
  
end