module Refinery
  module Students
    class StudentsController < ::ApplicationController

      before_action :find_all_students
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @student in the line below:
        present(@page)
        @sections = Refinery::Sections::Section.order(:position)
      end

      def show
        @student = Student.find(params[:id])

        respond_to do |format|
          format.js
          format.html { present(@page) }
        end  
      end

    protected

      def find_all_students
        @students = Student.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/students").first
      end

    end
  end
end
