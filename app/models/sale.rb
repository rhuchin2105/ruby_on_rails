class Sale < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :seller, optional: true
	belongs_to :customer, optional: true
end
