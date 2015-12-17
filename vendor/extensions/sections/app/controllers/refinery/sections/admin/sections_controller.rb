module Refinery
  module Sections
    module Admin
      class SectionsController < ::Refinery::AdminController

        crudify :'refinery/sections/section'

        private

        # Only allow a trusted parameter "white list" through.
        def section_params
          params.require(:section).permit(:title, :description_short, :description, :photo_id)
        end
      end
    end
  end
end
