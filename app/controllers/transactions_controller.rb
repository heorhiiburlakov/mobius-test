# frozen_string_literal: true

# transactions controller
class TransactionsController < ApplicationController
  def create
    @transaction = current_user.payments.build(transaction_params)

    if @transaction.save
      redirect_to users_path, notice: 'Operation is successful'
    else
      @users = ::User.all
      flash.now[:error] = @transaction.errors.full_messages.join(', ')
      render 'users/index'
    end
  end

  def history
    @payments = current_user.payments
    @incomes = current_user.incomes
  end

  private

  def transaction_params
    params.require(:transaction).permit(:to_user_id, :num_credits)
  end
end
