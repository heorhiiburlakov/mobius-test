# frozen_string_literal: true

# abstract controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
