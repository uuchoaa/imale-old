  
  class Management::ActionButton < Phlex::HTML
    include Phlex::Rails::Helpers::LinkTo

    def template
      link_to '/cadastros/naipes/novo', class: "block rounded-full bg-indigo-600 p-1 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600" do 
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