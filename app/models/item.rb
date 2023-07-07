class Item < ActiveRecord::Base
  belongs_to :category 
  belongs_to :user

  validates :name, presence: true
  validates :category_id, presence: true 
  validates :completed, inclusion: { in: [true, false] } 
  validates :completed_at, presence: true 
  
  # Returns an array of error messages generated during validation.
  def errors_array
    self.errors.full_messages
  end

  # Defines a class method that returns the items sorted by their names in lowercase.
  def self.by_name
    self.name.downcase
  end
end