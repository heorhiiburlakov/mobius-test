# frozen_string_literal: true

# user helper
module UsersHelper
  def render_payment_form(user)
    return 'It`s you' if user == current_user
    render partial: 'transactions/form', locals: { user: user }
  end
end
