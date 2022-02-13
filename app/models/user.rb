class User < ApplicationRecord
  rolify                    # add roles to the user model
  has_secure_password       # ensure passwords are hashed
  after_create :assign_default_role

  has_one :cart       # WIP, a user can has one cart
  has_many :orders          # WIP, a user can have many carts

  validates_presence_of :email      # new users must have an email and it must be unique.
  validates_uniqueness_of :email

  private

  # set default role of new user
  def assign_default_role
    add_role(:newuser) if roles.blank?
  end
end
