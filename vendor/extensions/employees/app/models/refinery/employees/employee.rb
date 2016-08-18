module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'

      validates :first_name, presence: true
      validates :last_name, presence: true
      validates :post, presence: true

      belongs_to :photo, class_name: '::Refinery::Image'

      def full_name
        [last_name, first_name, middle_name].join ' '
      end

      def title
        [full_name, post].join ', '
      end

      def photo_url
        photo.present? ? photo.url : 'no_picture.jpg'
      end
    end
  end
end
