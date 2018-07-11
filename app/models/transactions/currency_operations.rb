# frozen_string_literal: true

# provides currency specific methods
module CurrencyOperations
  extend ActiveSupport::Concern

  delegate :transform_credits, to: :class

  # class methods
  module ClassMethods
    def credits_amount_for(user_id)
      amount = User::INITIAL_CREDITS_AMOUNT
      transaction = select(*credits_query_for(user_id))[0]
      (amount + transaction.incomes.to_i - transaction.payments.to_i) / 100.0
    end

    def transform_credits(credits)
      (credits.to_f * 100).to_i
    end

    private

    def credits_query_for(user_id)
      sum = 'SUM(num_credits::int) '
      payments = sum + " FILTER (WHERE from_user_id = #{user_id}) as payments"
      incomes = sum + " FILTER (WHERE to_user_id = #{user_id}) as incomes"
      [payments, incomes]
    end
  end
end
