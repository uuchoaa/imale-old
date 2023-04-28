
class CrudGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  def create_domain_file
    template "domain_entity.rb.tt", File.join("app/domain/entities", class_path, "#{file_name}.rb")
    template "domain_repository_interface.rb.tt", File.join("app/domain/repositories", class_path, "#{file_name}_repository.rb")
  end

  def create_infrastructure_files
    generate "model", "#{file_name}_record #{attributes.map{|a| "#{a.name}:#{a.type}" }.join(' ')} --no-test-framework"
    template "infrastructure_repository.rb.tt", File.join("app/infrastructure/repositories/active_record", class_path, "#{file_name}_repository.rb")
  end

#   def create_adapter_files
#     template "adapter_controller.rb.tt", File.join("app/controllers", class_path, "#{plural_file_name}_controller.rb")
#   end
end
