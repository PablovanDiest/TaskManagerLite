class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :image_path
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
