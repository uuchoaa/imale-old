class NavMenuItemComponent < ApplicationComponent
  def initialize(item:, **css_classes)
    @item = item

    @regular_class = css_classes[:regular_class] || default_regular_class
    @active_class = css_classes[:active_class] || default_active_class
  end

  def template(&block)
    css_class = tokens(
      regular?: @regular_class, 
      active?: @active_class
    )

    a(href: @item.path, class: css_class, aria_current: "page") { @item.label }
  end

  private

  def active?
    @item.active?
  end

  def regular?
    not active?
  end

  def default_regular_class
    "inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium text-gray-500 border-transparent hover:border-gray-300 hover:text-gray-700"
  end

  def default_active_class
    "inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium text-gray-900 border-indigo-500 "
  end

end
