class TransactionsController < ApplicationController
	def create
		kitchen = Kitchen.find_by!(slug: params[:slug])
		sale = kitchen.sales.create(
			amount: kitchen.price,
			buyer_email: current_user.email,
			seller_email: kitchen.user.email,
			stripe_token: params[:stripeToken])
		sale.process!
		if sale.finished?
			redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
		else
			redirect_to kitchen_path(kitchen), notice: "Something went wrong"
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@kitchen = @sale.kitchen 
	end
end
end