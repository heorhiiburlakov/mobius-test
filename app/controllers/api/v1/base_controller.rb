# frozen_string_literal: true

module API
  module V1
    # base api controller
    class BaseController < ActionController::API
      include API::Shared::ExceptionHandler
      include API::Shared::Response
      include API::Shared::Auth
    end
  end
end
