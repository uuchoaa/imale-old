
class CrudGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

#   class_option :actions, type: :array, default: %w[list create show edit update destroy], desc: "Select specific actions to generate (list, create, show, edit, update destroy)"
  class_option :actions, type: :array, default: %w[list], desc: "Select specific actions to generate (list, create, show, edit, update destroy)"


  def create_domain_file
    template "domain_entity.rb.tt", File.join("app/domain/entities", class_path, "#{file_name}.rb")
    template "domain_repository_interface.rb.tt", File.join("app/domain/repositories", class_path, "#{file_name}_repository_interface.rb")
  end

  def create_infrastructure_files
    generate "model", "#{file_name}_record #{attributes.map{|a| "#{a.name}:#{a.type}" }.join(' ')} --no-test-framework"
    template "infrastructure_repository.rb.tt", File.join("app/infrastructure/repositories/active_record", class_path, "#{file_name}_repository.rb")
  end

  def create_application_files
    allowed_actions.each do |action|
      template "application_use_cases/#{action}_use_case.rb.tt", File.join("app/application/use_cases", class_path, "#{action}_#{plural_file_name}.rb")
    end
  end

#   def create_adapter_files
#     template "adapter_controller.rb.tt", File.join("app/controllers", class_path, "#{plural_file_name}_controller.rb")
#   end

  private 

  def allowed_actions
    options[:actions].any? ? options[:actions] : %w[list create show edit update destroy]
  end
  
end
