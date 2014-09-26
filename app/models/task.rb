class Task < ActiveRecord::Base
  belongs_to :company
  belongs_to :project
  belongs_to :customer

  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  belongs_to :deleted_by, :class_name => 'User'

  scope :actives, -> { where(:deleted_at => nil) }
end
