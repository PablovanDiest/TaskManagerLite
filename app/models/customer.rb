class Customer < ActiveRecord::Base
  belongs_to :company

  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  belongs_to :deleted_by, :class_name => 'User'

  scope :actives, -> { where(:deleted_at => nil) }
  #scope :published, -> { where(published: true) }
end
