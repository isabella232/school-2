# This migration comes from refinery_students (originally 1)
class CreateStudentsStudents < ActiveRecord::Migration

  def up
    create_table :refinery_students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :photo_id
      t.integer :section_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-students"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/students/students"})
    end

    drop_table :refinery_students

  end

end
