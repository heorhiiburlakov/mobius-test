# frozen_string_literal: true

module API
  module Shared
    # module provides exceptions handling
    module ExceptionHandler
      extend ActiveSupport::Concern

      included do
        rescue_from Exception, with: proc { |e| json_error(e.message, 500) }

        rescue_from ActiveRecord::RecordNotFound,
                    with: proc { |e| json_error(e.message, 404) }

        rescue_from ActiveRecord::RecordInvalid,
                    with: proc { |e| json_error(e.message, 422) }

        rescue_from NotImplementedError,
                    with: proc { |e| json_error(e.message, 501) }
      end
    end
  end
end
