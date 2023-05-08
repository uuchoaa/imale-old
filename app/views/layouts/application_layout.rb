# frozen_string_literal: true

class ApplicationLayout < ApplicationView
	include Phlex::Rails::Layout

	def template(&block)
    html do

      head do
        title { "MyApp" }
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        csrf_meta_tags
        csp_meta_tag
        stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload"
        stylesheet_link_tag "application", "data-turbo-track": "reload"
        javascript_importmap_tags
      end


      body do
        div(class: "min-h-full") do
          nav(class: "border-b border-gray-200 bg-white") do
            div(class: "mx-auto max-w-7xl px-4 sm:px-6 lg:px-8") do
              div(class: "flex h-16 justify-between") do
                div(class: "flex") do

                  render LogoComponent.new


                  yield(:nav_menu)

                end
              end
            end

            # Nav with NavItem MOBILE
            comment { "Mobile menu, show/hide based on menu state." }
            div(class: "sm:hidden", id: "mobile-menu") do
              div(class: "space-y-1 pb-3 pt-2") do
                comment do
                  %(Current: "border-indigo-500 bg-indigo-50 text-indigo-700", Default: "border-transparent text-gray-600 hover:border-gray-300 hover:bg-gray-50 hover:text-gray-800")
                end
                a(
                  href: "#",
                  class:
                    "block border-l-4 border-indigo-500 bg-indigo-50 py-2 pl-3 pr-4 text-base font-medium text-indigo-700",
                  aria_current: "page"
                ) { "Dashboard" }
                a(
                  href: "#",
                  class:
                    "block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-gray-600 hover:border-gray-300 hover:bg-gray-50 hover:text-gray-800"
                ) { "Team" }
                a(
                  href: "#",
                  class:
                    "block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-gray-600 hover:border-gray-300 hover:bg-gray-50 hover:text-gray-800"
                ) { "Projects" }
                a(
                  href: "#",
                  class:
                    "block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-gray-600 hover:border-gray-300 hover:bg-gray-50 hover:text-gray-800"
                ) { "Calendar" }
              end
              div(class: "border-t border-gray-200 pb-3 pt-4") do
                div(class: "flex items-center px-4") do
                  div(class: "flex-shrink-0") do
                    img(
                      class: "h-10 w-10 rounded-full",
                      src:
                        "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
                      alt: ""
                    )
                  end
                  div(class: "ml-3") do
                    div(class: "text-base font-medium text-gray-800") { "Tom Cook" }
                    div(class: "text-sm font-medium text-gray-500") do
                      "tom@example.com"
                    end
                  end
                  button(
                    type: "button",
                    class:
                      "ml-auto flex-shrink-0 rounded-full bg-white p-1 text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                  ) do
                    span(class: "sr-only") { "View notifications" }
                    svg(
                      class: "h-6 w-6",
                      fill: "none",
                      viewbox: "0 0 24 24",
                      stroke_width: "1.5",
                      stroke: "currentColor",
                      aria_hidden: "true"
                    ) do |s|
                      s.path(
                        stroke_linecap: "round",
                        stroke_linejoin: "round",
                        d:
                          "M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0"
                      )
                    end
                  end
                end
                div(class: "mt-3 space-y-1") do
                  a(
                    href: "#",
                    class:
                      "block px-4 py-2 text-base font-medium text-gray-500 hover:bg-gray-100 hover:text-gray-800"
                  ) { "Your Profile" }
                  a(
                    href: "#",
                    class:
                      "block px-4 py-2 text-base font-medium text-gray-500 hover:bg-gray-100 hover:text-gray-800"
                  ) { "Settings" }
                  a(
                    href: "#",
                    class:
                      "block px-4 py-2 text-base font-medium text-gray-500 hover:bg-gray-100 hover:text-gray-800"
                  ) { "Sign out" }
                end
              end
            end


          end
          div(class: "py-10 flex flex-col space-y-12") do
            header do
              div(class: "mx-auto max-w-7xl px-4 sm:px-6 lg:px-8") do
                yield(:hero)
              end
            end
            main do
              div(class: "mx-auto max-w-7xl sm:px-6 lg:px-8") do
                # comment { "Your content" }
                div(class: "border rounded-lg p-4") do
                  yield
                end
              end
            end
          end
        end
      end
    end
  end

 
end

