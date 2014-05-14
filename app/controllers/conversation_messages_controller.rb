class ConversationMessagesController < ApplicationController
  before_action :set_conversation_message, only: [:show, :edit, :update, :destroy]

  # GET /conversation_messages
  # GET /conversation_messages.json
  def index
    @conversation_messages = ConversationMessage.all
  end

  # GET /conversation_messages/1
  # GET /conversation_messages/1.json
  def show
  end

  # GET /conversation_messages/new
  def new
    @conversation_message = ConversationMessage.new
  end

  # GET /conversation_messages/1/edit
  def edit
  end

  # POST /conversation_messages
  # POST /conversation_messages.json
  def create
    @conversation_message = ConversationMessage.new(conversation_message_params)

    respond_to do |format|
      if @conversation_message.save
        format.html { redirect_to @conversation_message, notice: 'Conversation message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @conversation_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @conversation_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_by_conversation
      @messages = ConversationMessage.where(conversation_id: params[:conversation_id])
      render :json => @messages
  end

  # PATCH/PUT /conversation_messages/1
  # PATCH/PUT /conversation_messages/1.json
  def update
    respond_to do |format|
      if @conversation_message.update(conversation_message_params)
        format.html { redirect_to @conversation_message, notice: 'Conversation message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @conversation_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversation_messages/1
  # DELETE /conversation_messages/1.json
  def destroy
    @conversation_message.destroy
    respond_to do |format|
      format.html { redirect_to conversation_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation_message
      @conversation_message = ConversationMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_message_params
      params.require(:conversation_message).permit(:conversation_id, :user_id, :message, :time, :status)
    end
end
