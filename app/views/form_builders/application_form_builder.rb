class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  def text_field(attribute, options = {})
    add_tailwind_classes(options, 'block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6')
    super(attribute, options)
  end
  
  def label(attribute, label_text, options ={})
    add_tailwind_classes(options, 'block text-sm font-medium leading-6 text-gray-900')
    super(attribute, label_text, options)
  end

  def field(attribute, options = {})
    label_text = options.delete(:label)
    content_tag(:div, label(attribute, label_text) + content_tag(:div, text_field(attribute, options), class: 'mt-2'))
  end

  private

  def label(attribute, text)
    @template.label(@object_name, attribute, text, class: "block text-gray-700 text-sm font-bold mb-2")
  end

  def add_tailwind_classes(options, classes)
    options[:class] ||= ''
    options[:class] += " #{classes}"
  end
  
end