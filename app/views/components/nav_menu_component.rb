class NavMenuComponent < ApplicationComponent

  class NavMenuItemComponent < ApplicationComponent
    def initialize(item: , active:)
      @item = item
      @active = active

      @base_class = "inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium"
      @regular_class = "text-gray-500 border-transparent hover:border-gray-300 hover:text-gray-700"
      @active_class = "text-gray-900 border-indigo-500 "
    end

    def template(&block)
      css_class = tokens(
        @base_class, 
        regular?: @regular_class, 
        active?: @active_class
      )

      a(href: @item.path, class: css_class, aria_current: "page") { @item.label }
    end

    private

    def active?
      @active
    end

    def regular?
      not active?
    end
  end

  def initialize(items: [])
    @items = items
    @base_class = "hidden sm:-my-px sm:ml-6 sm:flex sm:space-x-8"
  end

  def template(&block)
    div(class: @base_class) do
      last_active_menu = nil
      active = false # only one active per NavMenu

      @items.each do |item|

        if item.active?

          if last_active_menu.nil?
            last_active_menu = item
            active = true
          else
            active = false
          end

        end

        render NavMenuItemComponent.new(item: item, active: active)
      end
    end
  end

  private

	def active? = @active
end