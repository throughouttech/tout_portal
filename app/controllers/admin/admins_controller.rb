class Admin::AdminsController < ApplicationController
	def show
	end

	def index
		@admin = Admin.all
	end

	def new
		@admin = Admin.new
	end

	def create
   	 @admin = Admin.new(admin_params)

    @admin.password = rand(11111111..99999999)

    raw, enc = Devise.token_generator.generate(Admin, :reset_password_token)
    @admin.reset_password_token = enc
    @admin.reset_password_sent_at = Time.now.utc
    @admin.password_token = raw

    respond_to do |format|
      if @admin.save
        format.html { redirect_to [:admin, @admin], notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_params
     params.require(:admin).permit(:email, :password)
  end

end
