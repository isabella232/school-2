module Refinery
  module Students
    class Student < Refinery::Core::BaseModel
      self.table_name = 'refinery_students'


      validates :first_name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
