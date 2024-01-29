class FlowSerializer < ActiveModel::Serializer

  attributes :id, :newStock, :previousStock, :book_name, :book_id

  def book_name
    "#{self.object.book.title}"
  end
end