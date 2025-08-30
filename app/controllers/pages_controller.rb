class PagesController < ApplicationController
	def home
		@sales = Sale.all
	end
end
