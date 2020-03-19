Stripe.api_key             = ENV['STRIPE_SECRET_KEY']     # e.g. sk_live_...
StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET'] # e.g. whsec_...

class RecordCharges
  def call(event)
    charge = event.data.object
    user = User.find_by(stripe_id: charge.customer)
    user.charges.create(
        stripe_id: charge.id,
        amount: charge.amount,
        card_last4: user.card_last4,
        card_exp_month: user.card_expiration_month,
        card_exp_year: user.card_expiration_year,
        card_brand: user.card_brand
    )
  end
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end