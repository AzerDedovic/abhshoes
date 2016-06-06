if Rails.env.development?
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_iexHNLbrGF8wsVWMsLZ62Ecm',
    :secret_key      => 'sk_test_DCLVDfPvkXmnfdfX9VXlli0p'
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key      => ENV['SECRET_KEY']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]