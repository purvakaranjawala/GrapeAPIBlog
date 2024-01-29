module Api
  module V1
    class Flows < Grape::API
      include Api::V1::Defaults
      # Nested resource so we need to add the post namespace
      namespace 'books/:book_id' do
        resources :flows do
          desc 'Create a flow.'
          params do
            requires :flow, type: Hash do
              requires :newStock, type: Integer, desc: 'New Stock.'
              requires :previousStock, type: Integer, desc: 'Previous Stock.'
            end
          end
          post do
            @book = Book.find_by(id: params[:book_id])
            @flow = @book.flows.create(permitted_params[:flow])
            @book.update(stock: @flow.newStock)
          end

          desc 'Get all flows of a book'
          get do
            @book = Book.find_by(id: params[:book_id])
            present @book.flows
          end
        end 
      end
    end
  end
end