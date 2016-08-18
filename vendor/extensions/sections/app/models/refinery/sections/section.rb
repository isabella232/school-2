module Refinery
  module Sections
    class Section < Refinery::Core::BaseModel
      self.table_name = 'refinery_sections'

      validates :title, presence: true, uniqueness: true
      validates :description_short, presence: true
      validates :description, presence: true

      belongs_to :photo, class_name: '::Refinery::Image'

      def photo_url
        photo.present? ? photo.url : 'no_picture.jpg'
      end
    end
  end
end
