# frozen_string_literal: true

# transactions class
class Transaction < ApplicationRecord
  include CurrencyOperations

  belongs_to :to_user, class_name: 'User', primary_key: :id
  belongs_to :from_user, class_name: 'User', primary_key: :id

  validates :to_user, :from_user, :num_credits, presence: true

  validate  :num_credits_bigger_zero
  validate  :check_credits_limit

  before_save :num_credits_prepare_for_db

  def num_credits
    read_attribute(:num_credits)&.to_f.try(:/, 100)
  end

  private

  def num_credits_prepare_for_db
    credits = read_attribute(:num_credits)
    self.num_credits = transform_credits(credits)
  end

  def num_credits_bigger_zero
    return unless read_attribute(:num_credits).to_f <= 0
    errors.add(:num_credits, 'should be bigger than 0')
  end

  def check_credits_limit
    user_credits = Transaction.credits_amount_for(from_user_id)
    return if read_attribute(:num_credits).to_f <= user_credits
    errors.add(:base, 'You are exceeded your credits amount')
  end
end
