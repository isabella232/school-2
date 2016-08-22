class AddWorkExperienceToRefineryEmpoyeesEmployee < ActiveRecord::Migration
  def change
    add_column :refinery_employees, :work_experience, :integer
  end
end
