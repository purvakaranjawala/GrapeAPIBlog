require "grape-swagger"

class Api::V1::Base < Grape::API
  # mount BookStore::V1::Books : this is the path to find our API, we will write all our API methods inside Books.rb    
  mount Api::V1::Books
  mount Api::V1::Flows
  # mount API::V1::AnotherResource

  add_swagger_documentation(
    api_version: "v1",
    hide_documentation_path: true,
    mount_path: "/api/v1/swagger_doc",
    hide_format: true
  )
end