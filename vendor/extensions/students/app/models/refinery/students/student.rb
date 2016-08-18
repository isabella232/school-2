module Refinery
  module Students
    class Student < Refinery::Core::BaseModel
      self.table_name = 'refinery_students'

      validates :first_name, presence: true
      validates :last_name, presence: true
      
      belongs_to :photo, class_name: '::Refinery::Image'
      belongs_to :section, class_name: 'Refinery::Sections::Section'
      belongs_to :coach, class_name: 'Refinery::Employees::Employee', foreign_key: 'employee_id'

      def full_name
        [last_name, first_name, middle_name].join ' '
      end
      
      def photo_url
        photo.present? ? photo.url : 'no_picture.jpg'
      end
    end
  end
end
