class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :registerable, and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Returns true if no admins have been registered yet, false otherwise.
  def self.registration_allowed?
    Admin.count == 0
  end
end
