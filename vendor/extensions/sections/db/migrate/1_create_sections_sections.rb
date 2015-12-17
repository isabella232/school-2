class CreateSectionsSections < ActiveRecord::Migration

  def up
    create_table :refinery_sections do |t|
      t.string :title
      t.text :description_short
      t.text :description
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sections"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/sections/sections"})
    end

    drop_table :refinery_sections

  end

end
