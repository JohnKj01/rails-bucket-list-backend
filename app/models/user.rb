class User < ApplicationRecord
    attr_accessor :username
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
end