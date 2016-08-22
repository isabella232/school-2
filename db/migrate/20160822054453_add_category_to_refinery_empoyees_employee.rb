class AddCategoryToRefineryEmpoyeesEmployee < ActiveRecord::Migration
  def change
    add_column :refinery_employees, :category, :string
  end
end
