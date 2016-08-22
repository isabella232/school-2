class AddSectionToEmployeesEmployee < ActiveRecord::Migration
  def change
    add_column :refinery_employees, :section_id, :integer
  end
end
