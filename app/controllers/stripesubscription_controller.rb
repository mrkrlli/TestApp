class StripesubscriptionController < ApplicationController
  def create
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    customer = Stripe::Customer.create(
      :source => params[:stripeToken],
      :plan => "test_plan",
      :email => params[:stripeEmail]
    )

    redirect_to root_path
  end
end
