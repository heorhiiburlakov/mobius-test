# frozen_string_literal: true

# users class
class User < ApplicationRecord
  INITIAL_CREDITS_AMOUNT = 100_00 # in cents

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :payments, class_name: 'Transaction', foreign_key: :from_user_id
  has_many :incomes, class_name: 'Transaction', foreign_key: :to_user_id
end
