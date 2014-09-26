class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :company, index: true
      t.string :file_path
      t.string :file_name
      t.integer :created_by_id
      t.datetime :created_at
      t.integer :updated_by_id
      t.datetime :updated_at
      t.integer :deleted_by_id
      t.datetime :deleted_at
      t.text :notes

      t.timestamps
    end
  end
end
