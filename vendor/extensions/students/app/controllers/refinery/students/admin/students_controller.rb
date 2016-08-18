module Refinery
  module Students
    module Admin
      class StudentsController < ::Refinery::AdminController

        crudify :'refinery/students/student',
                :title_attribute => 'first_name'

        private

        # Only allow a trusted parameter "white list" through.
        def student_params
          params.require(:student).permit(:first_name, :middle_name, :last_name, :photo_id, :section_id, :description)
        end
      end
    end
  end
end
