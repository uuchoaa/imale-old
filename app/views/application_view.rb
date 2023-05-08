# frozen_string_literal: true

class ApplicationView < ApplicationComponent
  include Phlex::Rails::Helpers::ContentFor

  def before_template
    return if @menu_items.nil? # this before_template runs even to ApplicationLayout

    content_for :nav_menu do
      render NavMenuComponent.new(items: @menu_items)
    end
	end

  def hero(text:)
    content_for :hero do
      h1(class: "text-3xl font-bold leading-tight tracking-tight text-gray-900") { text }
    end
  end


	# The ApplicationView is an abstract class for all your views.

	# By default, it inherits from `ApplicationComponent`, but you
	# can change that to `Phlex::HTML` if you want to keep views and
	# components independent.
end
