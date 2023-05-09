class MenuItemPresenter

  attr_reader :path, :label, :icon

  def initialize(active:, path:, label:, icon:)
    @active = active
    @path = path
    @label = label
    @icon = icon
  end

  def active?
    @active
  end

end