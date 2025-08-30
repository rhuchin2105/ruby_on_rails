class SalesController < ApplicationController
	before_action :set_sale, only: %i[ show edit update destroy ]

	def import
		file = params[:file]

		# Error
		return redirect_to root_path, alert: 'No file selected' unless file
		return redirect_to root_path, alert: 'Select File valid' unless file.content_type = 'text/csv' 

		# Save
		saleImportService = SaleImportService.new(file)
		saleImportService.import

		# Response
		return redirect_to root_path, notice: "#{saleImportService.number_imported_with_last_run} rows"
	end

	# GET /sales or /sales.json
	def index
		@sales = Sale.all
	end

	# GET /sales/1 or /sales/1.json
	def show
	end

	# GET /sales/new
	def new
		@sale = Sale.new
	end

	# GET /sales/1/edit
	def edit
	end

	# POST /sales or /sales.json
	def create
		@sale = Sale.new(sale_params)

		respond_to do |format|
			if @sale.save
				format.html { redirect_to @sale, notice: "Sale was successfully created." }
				format.json { render :show, status: :created, location: @sale }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @sale.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /sales/1 or /sales/1.json
	def update
		respond_to do |format|
			if @sale.update(sale_params)
				format.html { redirect_to @sale, notice: "Sale was successfully updated.", status: :see_other }
				format.json { render :show, status: :ok, location: @sale }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @sale.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /sales/1 or /sales/1.json
	def destroy
		@sale.destroy!

		respond_to do |format|
			format.html { redirect_to sales_path, notice: "Sale was successfully destroyed.", status: :see_other }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_sale
			@sale = Sale.find(params.expect(:id))
			# @customers = Customer.all
			# @sellers = Seller.all
			# @products = Product.all
		end

		# Only allow a list of trusted parameters through.
		def sale_params
			params.expect(sale: [ :cumtomer_id, :seller_id, :product_id, :price, :amount, :seller_address ])
		end
end
