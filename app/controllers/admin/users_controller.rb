class Admin::UsersController < ApplicationController

	def show
	end

	def index
		@user = User.all
	end

	def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
