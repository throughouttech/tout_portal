class Admin::UsersController < ApplicationController
  before_action :find_admin
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.password = rand(11111111..99999999)

    raw, enc = Devise.token_generator.generate(User, :reset_password_token)
    @user.reset_password_token = enc
    @user.reset_password_sent_at = Time.now.utc
    @user.password_token = raw

    respond_to do |format|
      if @user.save
         format.html { redirect_to admin_users_url, notice: 'user was successfully created.' }
         format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

   def user_params
     params.require(:user).permit(:email, :password)
  end

   def find_admin
    unless current_admin.present? 
      respond_to do |format|
          format.html { redirect_to new_admin_session, notice: 'please first sign in' }
      end
    end
  end

end