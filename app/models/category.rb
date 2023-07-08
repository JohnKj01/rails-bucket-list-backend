class Category < ApplicationRecord
    has_many :items
  
    validates :name, presence: true, uniqueness: true

    def errors_array
      self.errors.full_messages
    end
end
