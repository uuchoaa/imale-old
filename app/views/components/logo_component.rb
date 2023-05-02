class LogoComponent < ApplicationComponent
  # include Phlex::DeferredRender
  
  def template(&block)
    div(class: "flex flex-shrink-0 items-center") do
      img(
        class: "block h-8 w-auto lg:hidden",
        src:
          "https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600",
        alt: "Your Company"
      )
      img(
        class: "hidden h-8 w-auto lg:block",
        src:
          "https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600",
        alt: "Your Company"
      )
    end

  end
end