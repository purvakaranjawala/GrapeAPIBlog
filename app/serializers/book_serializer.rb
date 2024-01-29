class BookSerializer < ActiveModel::Serializer

  attributes :id, :isbn, :title, :stock
end