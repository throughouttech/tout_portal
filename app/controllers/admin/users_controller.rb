class Admin::UsersController < ApplicationController
  def show
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

   def user_params
     params.require(:user).permit(:email, :password)
  end

end
