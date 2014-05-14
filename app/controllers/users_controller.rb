class UsersController < ApplicationController
   skip_before_filter :verify_authenticity_token
   before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def existe
      facebookId = params[:facebook_id];
      
      if facebookId
        p "### FACEBOOK ID " + facebookId
      else
        p "### FACEBOOK ID NULL" 
      end if

      @usuario = User.where(facebook_id: facebookId).first
      
      respond_to do |format| 
        format.json { render json: @usuario }
      end
  end

  def registre_google_device
      device_reg_id = params[:device_reg_id]
      user_id       = params[:user_id]

      user = User.find(user_id)

      if(!user.google_devices.where(registration_id: device_reg_id).first)
        p "USER "+user.to_s
        device = user.google_devices.new(registration_id: device_reg_id)

        if device.save
          render json: {"result"=>"Registation sucess.", "result_code" => "1"}
        else
          render json: user.google_devices.errors
        end
      else
          render json: user.google_devices
      end
  end

  def unregistre_google_device
      device_reg_id = params[:device_reg_id]
      user_id       = params[:user_id]

      user = User.find(user_id)
      device = user.google_devices.where(registration_id: device_reg_id)
      if(device[0])
        if device[0].delete
          render json: {"result"=>"sucess","result_code"=>"1"}
        else
          render json: device.errors
        end
      else
          render json: {"result"=>"No device found.", "result_code"=>"0"}
      end
  end

  def get_google_devices
      user    = User.find(params[:user_id])
      devices = user.google_devices.load
      
      render json: user.google_devices
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :facebook_id)
    end
end
