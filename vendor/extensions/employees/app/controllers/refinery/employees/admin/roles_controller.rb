module Refinery
  module Employees
    module Admin
      class RolesController < ::Refinery::AdminController

        crudify :'refinery/employees/role'

        private

        # Only allow a trusted parameter "white list" through.
        def role_params
          params.require(:role).permit(:title)
        end
      end
    end
  end
end
