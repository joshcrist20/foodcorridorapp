class TransactionsController < ApplicationController
	def create
		kitchen = Kitchen.find_by!(slug: params[:slug])
		token = params[:stripeToken]

		begin
			charge = Stripe::Charge.create(
				amount: Kitchen.price,
				currency: "usd",
				card: token,
				description: current_user.email)
			@sale = kitchen.sales.create!(
				buyer_email: current_user.email)
			redirect_to pickup_url(guid: @sale.guid)
		rescue Stripe::CardError => e
			@error = e 
			redirect_to kitchen_path(kitchen), notice: @error 
		end
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@kitchen = @sale.kitcen 
	end
end