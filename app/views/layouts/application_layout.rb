# frozen_string_literal: true

class ApplicationLayout < ApplicationView
	include Phlex::Rails::Layout

	def template(&block)
		doctype

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
        main(class: "container px-5 mx-auto mt-28") do
          # flash.each do |key, message|
          #   div(
          #     class:
          #       %(alert-#{key} flex items-center mb-1 space-x-1 italic text-gray-600)
          #   ) do
          #     div do
          #       svg(
          #         class: "w-5",
          #         fill: "none",
          #         stroke: "currentColor",
          #         viewbox: "0 0 24 24",
          #         xmlns: "http://www.w3.org/2000/svg"
          #       ) do |s|
          #         s.path(
          #           stroke_linecap: "round",
          #           stroke_linejoin: "round",
          #           stroke_width: "2",
          #           d: "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          #         ) {}
          #       end
          #     end
          #     div { plain message }
          #   end
          # end
          plain yield
        end
      end
    end

	end
end

