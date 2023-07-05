class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :category_id
end
