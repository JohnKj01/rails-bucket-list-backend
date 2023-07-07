class AddCompletedByToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :completed_by, :date
  end
end
