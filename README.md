## TO DO

Feature: any user can CRUD instrument
- [x] Add tailwind
- [ ] Add application shell como theme
- [ ] Add template no index view
- [ ] ...
- [ ] Create new instrument
- [ ] Show instrument
- [ ] Edit instrument
- [ ] Delete instrument
- [ ] Add Layout with tailwind

Feature: only admin user can CRUD instrument
- [ ] add entity User
- [ ] ListInstruments use case deve receber user e chekcar se perfil é admin: é regra de negócio, deve tá em UseCases!

- [ ] Gerar por padrão InMemory Repository e não ActiveRecord
- [ ] Criar teste para ListInstrumetns
- [ ] ...


### might do

- [ ] Add gerador para activerecord repository
- [ ] Add gerador para UseCases (identificar por padrão os verbos de CRUD.. List<Entity>, CreateNew<Entity>, etc)
- [ ] Gerador de CRUD gerar tbm os tests com MiniTest

## Generators

Here is the final version of the `CRUDGenerator` class:

```ruby
class CRUDGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  
  class_option :actions, type: :array, default: [], desc: "Select specific actions to generate (index, new, show, edit, create, update, destroy)"

  def create_domain_files
    template "domain_entity.rb.tt", File.join("app/domain/entities", class_path, "#{file_name}.rb")
    template "domain_repository_interface.rb.tt", File.join("app/domain/repositories", class_path, "#{file_name}_repository.rb")
  end

  def create_application_files
    template "application_use_case.rb.tt", File.join("app/application/use_cases", class_path, "#{file_name}", "#{file_name}_interactor.rb")
  end

  def create_infrastructure_files
    template "infrastructure_repository.rb.tt", File.join("app/infrastructure/repositories", class_path, "#{file_name}_repository.rb")
  end

  def create_adapter_files
    template "adapter_controller.rb.tt", File.join("app/controllers", class_path, "#{plural_file_name}_controller.rb") if allowed_actions.any?
  end

  def create_active_record_model
    generate "model", "#{file_name}_record #{attributes.map(&:to_s).join(' ')} --no-test-framework"
  end

  def create_views
    create_index_view if allowed_actions.include?("index")
    create_new_view if allowed_actions.include?("new") || allowed_actions.include?("create")
    create_edit_view if allowed_actions.include?("edit") || allowed_actions.include?("update")
    create_show_view if allowed_actions.include?("show")
    create_partial_form_view if allowed_actions.include?("new") || allowed_actions.include?("create") || allowed_actions.include?("edit") || allowed_actions.include?("update")
  end

  def create_index_view
    template "adapter_views/index.html.erb.tt", File.join("app/views", plural_file_name, "index.html.erb")
  end

  def create_new_view
    template "adapter_views/new.html.erb.tt", File.join("app/views", plural_file_name, "new.html.erb")
  end

  def create_edit_view
    template "adapter_views/edit.html.erb.tt", File.join("app/views", plural_file_name, "edit.html.erb")
  end

  def create_show_view
    template "adapter_views/show.html.erb.tt", File.join("app/views", plural_file_name, "show.html.erb")
  end

  def create_partial_form_view
    template "adapter_views/_form.html.erb.tt", File.join("app/views", plural_file_name, "_form.html.erb")
  end

  private

  def allowed_actions
    options[:actions].any? ? options[:actions] : %w[index new show edit create update destroy]
  end
end
```

Make sure to update the template file paths in the `source_root` line at the beginning of the class definition to match the new name of the generator.

Now, when you run the generator with the following command:

```sh
rails g crud Instrument name --actions index,new
```

It will generate only the specified actions (index and new) for the Instrument controller and views.