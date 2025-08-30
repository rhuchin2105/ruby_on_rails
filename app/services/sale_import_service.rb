class SaleImportService

	# require 'csv'

	def initialize(file)
		@file = file
		@count = 0
	end

	def import
		@count = 0

		# Saving data with CSV
		# CSV.foreach(@file.path, headers: true) do |row|
		# 	Sale.create! row.to_hash
		# 	puts "Data: #{row}"
		# 	@count += 1
		# end

		# Saving data with Spreadsheet
		result = Roo::Spreadsheet.open(@file.path)
		result.sheet(0).each_with_index(
			customer_id: 'Cliente',
			product_id: 'Descripción del Producto',
			price: 'Precio por pieza',
			amount: 'Numero de piezas',
			seller_address: 'Diección del vendedor',
			seller_id: 'Nombre del Vendedor'
		) do |row, row_index|
			next if row_index == 0

			# Validation for Customer
			# c_exists = Customer.where(name: row[:customer_id]).first
			# if c_exists.count > 0
			# 	customer = Customer.find(c_exists.id)
			# else
			# 	customer = Customer.create(
			# 		name: row[:customer_id]
			# 	)
			# end
			customer = Customer.where(name: row[:customer_id]).first_or_create

			# Validation for Product
			# p_exists = Product.where(name: row[:product_id]).first
			# if p_exists.count > 0
			# 	product = Product.find(p_exists.id)
			# else
			# 	product = Product.create(
			# 		name: row[:product_id]
			# 	)
			# end
			product = Product.where(name: row[:product_id], price: row[:price]).first_or_create

			# Validation for Seller
			# s_exists = Seller.where(name: row[:seller_id]).first
			# if s_exists.count > 0
			# 	seller = Seller.find(s_exists.id)
			# else
			# 	seller = Seller.create(
			# 		name: row[:seller_id]
			# 	)
			# end
			seller = Seller.where(name: row[:seller_id]).first_or_create

			Sale.create(
				cumtomer_id: customer.id,
				product_id: product.id,
				price: row[:price],
				amount: row[:amount],
				seller_address: row[:seller_address],
				seller_id: seller.id
			)

			@count += 1
		end
	end

	def number_imported_with_last_run
		@count
	end
end