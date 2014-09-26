class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :company, index: true
      t.references :project, index: true
      t.references :customer, index: true
      t.string :design_document
      t.datetime :from
      t.datetime :until
      t.string :case
      t.string :case_link
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
