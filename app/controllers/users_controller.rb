# frozen_string_literal: true

# users controller
class UsersController < ApplicationController
  def index
    @users = ::User.all
    @transaction = ::Transaction.new
  end
end
