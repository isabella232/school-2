module Refinery
  module Sections
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Sections

      engine_name :refinery_sections

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sections"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.sections_admin_sections_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Sections)
      end
    end
  end
end
