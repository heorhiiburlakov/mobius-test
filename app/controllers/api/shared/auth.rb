# frozen_string_literal: true

module API
  module Shared
    # module provides auth logic
    module Auth
      extend ActiveSupport::Concern

      included do
        before_action :authenticate_user!
      end

      def current_user
        @current_user ||= User.find_by!(email: params[:email]&.downcase)
      end

      private

      def authenticate_user!
        json_error('Unauthorized', 401) unless signed_in?
      end

      def signed_in?
        current_user&.valid_password?(params[:password])
      end
    end
  end
end
