module Refinery
  module Students
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Students

      engine_name :refinery_students

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "students"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.students_admin_students_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Students)
      end
    end
  end
end
