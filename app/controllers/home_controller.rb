class HomeController < ApplicationController
	def top
		@user = User.new
		@books = Book.new
	end

	def about
	end
end
