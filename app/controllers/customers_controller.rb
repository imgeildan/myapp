class CustomersController < ApplicationController
	before_action :destroy_customers, only: :index

  	def index
		# 150.times do
		# 	Stripe::Customer.create({
  		# 		name: Faker::Name.name,
  		# 		email: Faker::Internet.email
		# 	})
		# end
	begin
		customers = Stripe::Customer.list({ limit: 150 })

	    customers.each do |customer|
	    	Customer.create(external_id: customer['id'],
	    					name: customer['name'],
	    					email: customer['email'])
	    end
	    @customers = Customer.all.page(params[:page]).per(50)

	rescue Stripe::RateLimitError # if response.status == 429
		# Too many requests made to the API too quickly
		render :error
	end
	end

	def download
		@customers = Customer.all.page(params[:page]).per(50)
		send_data @customers.to_csv, filename: "customers-#{Date.today}.csv"
	end

	def error; end

	private

	def destroy_customers
		Customer.destroy_all
	end
end