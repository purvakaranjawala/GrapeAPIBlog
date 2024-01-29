module Api
  module V1
    class Books < Grape::API
      include Api::V1::Defaults

      resource :books do
        desc "Return all books", 
          success: [items: [Book.all]]
        get "", root: :books do
          Book.all
        end

        desc "Return a book by id"
        params do
          requires :id, type: String, desc: "ID of the 
            Book"
        end
        get ":id", root: :book do
          book = Book.find_by(id: permitted_params[:id])
          present book
        end

        desc 'Create a book.'
        params do
          requires :title, type: String, desc: 'Book title.'
          requires :isbn, type: Integer, desc: 'Random book number'
        end
        post do
          Book.create!({
            title: permitted_params[:title],
            isbn: permitted_params[:isbn]
          })
        end

        desc 'Update a Book Title.'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
          requires :title, type: String, desc: 'Book Title.'
        end
        put ':id' do
          book = Book.find_by(id: permitted_params[:id]).update(title: permitted_params[:title])
          present book
        end

        desc 'Delete a book.'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        delete ':id' do
          Book.find_by(id: permitted_params[:id]).delete
        end
      end
    end
  end
end