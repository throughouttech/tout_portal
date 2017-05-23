class LeavesController < ApplicationController

    after_filter :send_admin_mail, only: [:update]
    after_filter :send_user_mail, only: [:approve, :reject]
	def index
    @leave = Leave.order("updated_at DESC").where user_id: current_user.id 
	end
	def new
		@leave=Leave.new
	end

  def edit
    @leave = Leave.find(params[:id])
  end

  def update
    @leave = Leave.find(params[:id])
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to leaves_url, notice: 'leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave }
      else
        format.html { render :edit }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

def approve
  @leave = Leave.find(params[:id])
  @leave.status="Approved"
  @leave.save
  respond_to do |format|
    format.html { redirect_to admin_leaves_url, notice: 'Status was successfully updated.' }
  end
end

 def reject
  @leave = Leave.find(params[:id])
  @leave.status="Rejected"
  @leave.save
   respond_to do |format|
    format.html { redirect_to admin_leaves_url, notice: 'Status was successfully updated.' }
  end
 end

	def create
    @leave = current_user.leaves.new(leave_params)
    respond_to do |format|
      if @leave.save
        format.html { redirect_to leaves_url, notice: 'Leave was successfully created.' }
        format.json { render :show, status: :created, location: @leave }
      else
        format.html { render :new }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
	end

  def destroy
    @leave = Leave.find(params[:id])
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: 'leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
	def leave_params
     params.require(:leave).permit(:description, :start_at, :end_at, :user_id, :leave_type_id, :leave_for)
  end

  def send_admin_mail
    AdminMailer.leave_update_mail(current_user).deliver
  end 

  def send_user_mail
    @leave = Leave.find(params[:id])
    UserMailer.leave_status_email(@leave.user).deliver
  end 
  
end
