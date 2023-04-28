# require 'rails/generators/named_base'

class CrudGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  def create_domain_file
    template "domain_entity.rb.tt", File.join("app/domain/entities", class_path, "#{file_name}.rb")
  end

#   def create_application_files
#     template "application_create_use_case.rb.tt", File.join("app/application/use_cases", class_path, "create_#{file_name}.rb")
#     template "application_list_use_case.rb.tt", File.join("app/application/use_cases", class_path, "list_#{plural_file_name}.rb")
#     template "application_update_use_case.rb.tt", File.join("app/application/use_cases", class_path, "update_#{file_name}.rb")
#     template "application_delete_use_case.rb.tt", File.join("app/application/use_cases", class_path, "delete_#{file_name}.rb")
#   end

#   def create_infrastructure_files
#     template "infrastructure_repository.rb.tt", File.join("app/infrastructure/repositories", class_path, "#{file_name}_repository.rb")
#   end

#   def create_adapter_files
#     template "adapter_controller.rb.tt", File.join("app/controllers", class_path, "#{plural_file_name}_controller.rb")
#   end
end
