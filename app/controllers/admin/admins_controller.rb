class Admin::AdminsController < ApplicationController
	def show
	end

	def index
		@admin = Admin.all
	end

end
