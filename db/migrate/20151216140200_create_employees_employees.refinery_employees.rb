# This migration comes from refinery_employees (originally 1)
class CreateEmployeesEmployees < ActiveRecord::Migration

  def up
    create_table :refinery_employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :photo_id
      t.string :post
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employees"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employees/employees"})
    end

    drop_table :refinery_employees

  end

end
