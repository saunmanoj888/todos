class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :item_list
  has_many :items

  def item_list
    object.item_list
  end
end
