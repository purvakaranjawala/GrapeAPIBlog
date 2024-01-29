# Grape APIs are Rack applications that are created by subclassing you API modules or classes under Grape::API.

class Api::Base < Grape::API
  mount Api::V1::Base
end
