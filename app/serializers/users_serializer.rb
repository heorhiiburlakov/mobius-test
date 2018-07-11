# frozen_string_literal: true

# user serializer
class UsersSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user

  attributes :email

  attribute :num_credits do |user|
    ::Transaction.credits_amount_for(user.id)
  end
end
