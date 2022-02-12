class User < ApplicationRecord
  rolify
  has_secure_password
  after_create :assign_default_role

  has_one :cart
  has_many :orders

  validates_presence_of :email
  validates_uniqueness_of :email

  private

  def assign_default_role
    add_role(:newuser) if roles.blank?
  end
end
