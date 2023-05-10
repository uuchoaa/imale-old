class Management::IndexView < ApplicationView
  include Phlex::DeferredRender
  include Phlex::Rails::Helpers::LinkTo

  def initialize(**props)
    @main_area = props[:main_area]
    @right_area = props[:right_area]
    @menu_items = props[:menu_items]
    @active_menu_item = props[:active_menu]
  end

  def main_area(component:)
    @main_area = component
  end

  def right_area(component:)
    @right_area = component
  end

  def active_menu(item_reference)
    @active_menu_item = item_reference
  end

  def build_menu_items(active_item)
    [
      MenuItemPresenter.new(active: active_item == :instruments, path: '/cadastros/naipes', label: 'Naipes', icon: '...'),
      MenuItemPresenter.new(active: active_item == :class_terms, path: '/cadastros/turmas', label: 'Turmas', icon: '...'),
      # MenuItemPresenter.new(active: active_item == :concerts, path: '/cadastros/apresentacoes', label: 'Apresentações', icon: '...'),
    ]
  end

  def sidebar_menu
    build_menu_items(@active_menu_item)
  end


  def template(&block)
    hero text: 'Cadastros'

    div(class: "mx-auto w-full max-w-7xl grow flex xl:px-2") do

      div(class: "basis-44 border-gray-200 py-6 xl:w-36 xl:shrink-0 xl:border-b-0 xl:px-0 border-r") do 
        # h1 { "Left column area" }
        ul(role: "list", class: "space-y-2") do

          sidebar_menu.each do |menu_item|
            active_class = "flex justify-between gap-x-6 py-2 rounded-l-md pl-4 bg-gray-50 border-transparent -translate-y-0.5 scale-101 border-r-2 border-r-indigo-500"
            regular_class = "flex justify-between gap-x-6 py-2 cursor-pointer rounded-l-md pl-4 border-r-2 border-transparent hover:bg-gray-50 hover:border-r-indigo-500 duration-300"

            render NavMenuItemComponent.new(
              item: menu_item, 
              active_class: active_class, 
              regular_class: regular_class
            )
          end

        end
      end

      div(class: "flex w-full") do
        div(class: "basis-1/2 px-0 py-6 sm:px-4 xl:flex-1") do
          # h1 { "Main area" }

          if @main_area
            render @main_area
          end

        end
        div( class: "basis-1/2 border-gray-200 px-4 py-6 sm:px-4 sm:border-l lg:border-t-0 lg:pr-8 xl:pr-6" ) do
          # h1 { "Right column area" }

          if @right_area
            render @right_area
          end

        end
      end
    end

  end
  
end