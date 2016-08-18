module Refinery
  module Employees
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Employees

      engine_name :refinery_employees

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "roles"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.employees_admin_roles_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/employees/roles(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Roles)
      end
    end
  end
end
