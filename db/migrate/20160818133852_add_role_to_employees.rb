class AddRoleToEmployees < ActiveRecord::Migration
  def change
    remove_column :refinery_employees, :post
    add_column :refinery_employees, :role_id, :integer
  end
end
