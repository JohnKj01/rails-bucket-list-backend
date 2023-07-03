class Category < ApplicationRecord
    has_many :items # Defines a one-to-many association with the `Item` model.
  
    validates :name, presence: true, uniqueness: true
    # Validates that the `name` attribute is present and unique.
    # If the validation fails, it generates an error message.
    # `presence: true` ensures that the `name` attribute is not blank.
    # `uniqueness: true` ensures that the `name` attribute is unique among all categories.
  
    # Returns an array of error messages generated during validation.
    def errors_array
      self.errors.full_messages
    end
end
