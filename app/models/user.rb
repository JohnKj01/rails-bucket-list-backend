class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  
    # Associations
    has_many :items
    
    private
  
    def password_required?
      new_record? || password.present?
    end
end