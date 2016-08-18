class AddCoachIdToRefineryStudents < ActiveRecord::Migration
  def change
    add_column :refinery_students, :employee_id, :integer
  end
end
