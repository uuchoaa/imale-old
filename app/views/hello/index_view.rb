# frozen_string_literal: true

# <div class="App">
#   <header class="App-header">
#     <img src="Octocat.png" class="App-logo" alt="logo" />
#     <p>
#       GitHub Codespaces <span class="heart">♥️</span> Rails
#     </p>
#     <p class="small">
#       Edit <code>app/views/hello/index.html.erb</code> and see changes live!
#     </p>
#   </header>
# </div>


class Hello::IndexView < ApplicationView

  def initialize(menu_items:)
    @menu_items = menu_items
  end

  def template
    h1(class: 'font-bold text-4xl text-blue-500') { "Início" }
  end
end
