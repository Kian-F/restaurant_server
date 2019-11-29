class UsersController < ApplicationController
  # before_action :check_for_admin, :only => [:index]

  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  def current
    if current_user.present?
      render :json => current_user, :include => [:orders => { :include => [:line_items => {:include => :product}] }]
    else
      render :json => {}
    end
  end

  def index
    @users = User.all
    render :json => @users, :include => :orders
  end

  def show


  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      render json: {created: true}
    else
      render json: {errors: @user.errors.full_messages, }, status: 422
    end
    # respond_to do |format|
    #   if @user.save
    #     session[:user_id] = @user.id
    #
    #     render json: {created: true}
    #     # format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     # format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:order_id, :name, :email, :phone_number, :address, :admin, :password, :password_confirmation)
    end

end
