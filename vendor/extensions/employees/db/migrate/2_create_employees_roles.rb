class CreateEmployeesRoles < ActiveRecord::Migration

  def up
    create_table :refinery_employees_roles do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employees"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employees/roles"})
    end

    drop_table :refinery_employees_roles

  end

end
