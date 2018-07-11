# frozen_string_literal: true

module API
  module Shared
    # module provides response handling
    module Response
      def json_success(object, status: :ok, opts: {})
        json_body(serialize(object, opts), status)
      end

      def json_error(msg, status)
        json_body({ message: msg, status: status }, status)
      end

      private

      def json_body(body, status)
        render json: body, status: status
      end

      def serialize(object, opts)
        serializer.new(object, opts).serialized_json
      end

      # need to be redefined in api controller
      def serializer
        raise NotImplementedError
      end
    end
  end
end
