class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :role, limit: 5
      t.boolean :super_admin
      t.integer :created_by_id
      t.datetime :created_at
      t.integer :updated_by_id
      t.datetime :updated_at
      t.integer :deleted_by_id
      t.datetime :approved_at
      t.integer :approved_by_id
      t.datetime :deleted_at
      t.text :notes

      t.timestamps
    end
  end
end
