class Admin::LeaveTypesController < ApplicationController
	before_action :set_leave_type, only: [:edit, :update]
  before_action :find_admin
  
	def index
		@leave_type = LeaveType.all
	end

	def new
		@leave_type = LeaveType.new
	end

	def edit
	end

	def create
   	@leave_type = LeaveType.new(leave_type_params)
		respond_to do |format|
      if @leave_type.save
        format.html { redirect_to admin_leave_types_url, notice: 'Leave Type was successfully created.' }
        format.json { render :show, status: :created, location: @leave_type }
      else
        format.html { render :new }
        format.json { render json: @leave_type.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
    respond_to do |format|
      if @leave_type.update(leave_type_params)
        format.html { redirect_to admin_leave_types_url, notice: 'Leave Type was successfully updated.' }
        format.json { render :admin_leave_types, status: :ok, location: @leave_type }
      else
        format.html { render :edit }
        format.json { render json: @leave_type.errors, status: :unprocessable_entity }
      end
    end
  end

	 def destroy
    @leave_type = LeaveType.find(params[:id])
    @leave_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_leave_types_url, notice: 'Leave type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def leave_type_params
    params.require(:leave_type).permit(:name, :description, :active)
  end

  def set_leave_type
    @leave_type = LeaveType.find(params[:id])
  end
	
   def find_admin
    unless current_admin.present? 
      respond_to do |format|
          format.html { redirect_to new_admin_session, notice: 'please first sign in' }
      end
    end
  end
end
