class Todo < ApplicationRecord
  has_many :items

  def item_list
    @item_list ||= items.pluck(:name)
  end
end
