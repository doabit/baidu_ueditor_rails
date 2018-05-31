class CreateUeditorAssets < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :ueditor_assets do |t|
      t.string :name
      t.string  :type, limit: 30

      t.timestamps
    end
    add_index :ueditor_assets, :type
  end
end