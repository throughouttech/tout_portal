class Admin::LeavesController < ApplicationController
	before_action :find_admin
	def index
		@leave = Leave.order("updated_at DESC")
	end

  def leave_params
    params.require(:leave).permit(:status)
  end

  def find_admin
    unless current_admin.present? 
      respond_to do |format|
          format.html { redirect_to new_admin_session, notice: 'please first sign in' }
      end
    end
  end

end
