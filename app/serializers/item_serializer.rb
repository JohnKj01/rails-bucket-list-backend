class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :category_id, :completed_by
end
