# frozen_string_literal: true

module API
  module V1
    # users controller
    class UsersController < BaseController
      def current
        json_success(current_user)
      end

      private

      def serializer
        UsersSerializer
      end

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
