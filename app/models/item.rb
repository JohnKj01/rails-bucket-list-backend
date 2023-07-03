class Item < ActiveRecord::Base
  belongs_to :category # Defines a one-to-one association with the `Category` model.

  validates :name, presence: true # Validates that the `name` attribute is present.
  validates :category_id, presence: true # Validates that the `category_id` attribute is present.
  validates :completed, inclusion: { in: [true, false] } # Validates that the `completed` attribute is either true or false.

  # Returns an array of error messages generated during validation.
  def errors_array
    self.errors.full_messages
  end

  # Defines a class method that returns the items sorted by their names in lowercase.
  def self.by_name
    self.name.downcase
  end
end