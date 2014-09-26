class User < ActiveRecord::Base

  attr_accessor :company_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  belongs_to :deleted_by, :class_name => 'User'

  scope :actives, where(:deleted_at => nil)

  def company
    Company.find_by_created_by_id(id)
  end
end
