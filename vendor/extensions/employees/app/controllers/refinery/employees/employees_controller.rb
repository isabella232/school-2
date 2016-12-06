module Refinery
  module Employees
    class EmployeesController < ::ApplicationController

      #before_action :find_all_employees
      before_action :find_page, only: [:index, :show]

      def index
        @employees = Employee.includes(:role).administration.order('refinery_employees_roles.position ASC')
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employee in the line below:
        present(@page)
      end

      def show
        @employee = Employee.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employee in the line below:
        present(@page)
      end
      
      def coaches
        @coaches = Employee.coaches.order('position ASC')
        @page = ::Refinery::Page.where(:link_url => "/employees/coaches").first
      end  

    protected

      def find_all_employees
        @employees = Employee.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/employees").first
      end

    end
  end
end
