module Refinery
  module Employees
    class RolesController < ::ApplicationController

      before_action :find_all_roles
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @role in the line below:
        present(@page)
      end

      def show
        @role = Role.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @role in the line below:
        present(@page)
      end

    protected

      def find_all_roles
        @roles = Role.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/roles").first
      end

    end
  end
end
