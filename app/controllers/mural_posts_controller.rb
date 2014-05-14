class MuralPostsController < ApplicationController
   before_action :set_mural_post, only: [:show, :edit, :update, :destroy]

  # GET /mural_posts
  # GET /mural_posts.json
  def index
    @mural_posts = MuralPost.all

   p "asdasdasasd"
  end

  # GET /mural_posts/1
  # GET /mural_posts/1.json
  def show
  end

  # GET /mural_posts/new
  def new
    @mural_post = MuralPost.new
  end

  # GET /mural_posts/1/edit
  def edit
  end

  # POST /mural_posts
  # POST /mural_posts.json
  def create
    p "## TESTE #" 
    @mural_post = MuralPost.new( user_id:   params[:user_id], 
                                 latitude:  params[:latitude], 
                                 longitude: params[:longitude], 
                                 message:   params[:message]
                               ).order(:id)

    respond_to do |format|
      if @mural_post.save
        format.html { redirect_to @mural_post, notice: 'Mural post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mural_post }
      else
         p "## ERRO #" 
        format.html { render action: 'new' }
        format.json { render json: @mural_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mural_posts/1
  # PATCH/PUT /mural_posts/1.json
  def update
    respond_to do |format|
      if @mural_post.update(mural_post_params)
        format.html { redirect_to @mural_post, notice: 'Mural post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mural_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mural_posts/1
  # DELETE /mural_posts/1.json
  def destroy
    @mural_post.destroy
    respond_to do |format|
      format.html { redirect_to mural_posts_url }
      format.json { head :no_content }
    end
  end

  def delete
    @mural_post = MuralPost.find(params[:id])
    @mural_post.destroy

    respond_to do |format|
      format.html { redirect_to mural_posts_url }
      format.json { head :no_content }
    end
  end

  def get_nearby
    lat_lng_distance_parameters  
    
    @mural_posts = MuralPost.near([@lat, @lng], @distance) 
    
    render :json => @mural_posts
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_mural_post
      @mural_post = MuralPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mural_post_params
      params.require(:mural_post).permit(:user_id, :latitude, :longitude, :message)
    end

    def lat_lng_distance_parameters
        p '##DEBUG## EXCEPTION!'
        pLatLngDistance = params[:lat_lng_distance].to_s.gsub(',','.').split(';')
   
       @lat      = pLatLngDistance[0].to_f
       @lng      = pLatLngDistance[1].to_f
       @distance = pLatLngDistance[2].to_f
           
         p '##DEBUG## pLatLngDistance '+pLatLngDistance.to_s
        
        if @lng == 0 or @lng == 0
          p '##DEBUG## EXCEPTION!'
          raise Exception.new('MURAL_POST:OOO1 - Parameters latitude or longitude not found.');
        end  
    end 
end
