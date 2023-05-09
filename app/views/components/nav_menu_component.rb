class NavMenuComponent < ApplicationComponent

  def initialize(items: [])
    @items = items
    @base_class = "hidden sm:-my-px sm:ml-6 sm:flex sm:space-x-8"
  end

  def template(&block)
    div(class: @base_class) do
      @items.each do |item|
        render NavMenuItemComponent.new(item: item)
      end
    end
  end


  private

	def active? = @active
end