module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'

      validates :first_name, presence: true
      validates :last_name, presence: true
      validates :role_id, presence: true
      
      belongs_to :role, class_name: 'Refinery::Employees::Role'
      belongs_to :section, class_name: 'Refinery::Sections::Section'
      belongs_to :photo, class_name: '::Refinery::Image'
      
      scope :coaches, -> {joins(:role).where("refinery_employees_roles.title = 'Тренер-преподаватель'")}
      scope :administration, -> {joins(:role).where("refinery_employees_roles.title != 'Тренер-преподаватель'")}
      
      CATEGORIES = ['Высшая', 'Первая']
      
      def full_name
        [last_name, first_name, middle_name].join ' '
      end

      def title
        [full_name, role.try(:title)].join ', '
      end

      def photo_url
        photo.present? ? photo.url : 'no_picture.jpg'
      end
    end
  end
end
