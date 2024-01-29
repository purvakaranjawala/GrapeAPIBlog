module Api::V1::Defaults
  extend ActiveSupport::Concern
  included do
    prefix "api"
    version "v1", using: :path
    default_format :json
    format :json
    formatter :json, 
          Grape::Formatter::ActiveModelSerializers

    helpers do
      def permitted_params
        @permitted_params ||= declared(params, 
            include_missing: false)
      end

      def logger
        Rails.logger
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      logger.info "Test #{e.message}"
      rack_response('{ "status": 404, "message": "Not Found." }', 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response(message: e.message, status: 422)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      rack_response({
        status: e.status,
        error_msg: e.message,
      }.to_json, 400)
    end
  end
end
