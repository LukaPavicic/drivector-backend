class V1::SubscriptionsController < ApplicationController
  def create
    if params[:plan_id] == 1
      selected_plan = Stripe::Plans::STANDARD
    elsif params[:plan_id] == 2
      selected_plan = Stripe::Plans::PRO
    else
      selected_plan = nil
    end

    if @current_user.stripe_id?
      customer = Stripe::Customer.retrieve(@current_user.stripe_id)
    else
      customer = Stripe::Customer.create(
          source: params[:token][:token][:id],
          plan: selected_plan,
          email: @current_user.email
      )

      @current_user.stripe_id = customer.id
      @current_user.stripe_subscription_id = customer.subscriptions.data[0].id
      @current_user.card_last4 = customer.sources.data[0].last4
      @current_user.card_brand = customer.sources.data[0].brand
      @current_user.card_expiration_month = customer.sources.data[0].exp_month
      @current_user.card_expiration_year = customer.sources.data[0].exp_year
      @current_user.save

      render json: customer, status: 200
    end

    p customer
  end

  def show

  end

  def destroy

  end
end
