class UsuariosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end
  
  def existe
      facebookId = params[:facebook_id];
      
      if facebookId
        p "### FACEBOOK ID " + facebookId
      else
        p "### FACEBOOK ID NULL" 
      end if

      @usuario = Usuario.where(facebook_id: facebookId).first
      
      respond_to do |format| 
        format.json { render json: @usuario }
      end
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(nome: params[:nome], facebook_id: params[:facebook_id])

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @usuario }
      else
        format.html { render action: 'new' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  def set_localizacao
      usuario = Usuario.find(params[:usuario_id])
      usu_local = usuario.usuario_localizacao.create(latitude: params[:latitude], longitude: params[:longitude])
      usu_local.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :facebook_id)
    end
end
