class Company < ActiveRecord::Base
  has_many :customers
  has_many :projects
  has_many :tasks

  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  belongs_to :deleted_by, :class_name => 'User'

  scope :actives, where(:deleted_at => nil)

end
