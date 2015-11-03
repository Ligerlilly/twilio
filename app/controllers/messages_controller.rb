class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    address = Address.find_or_initialize_by(number: params[:number])
    if !@message.addresses.include?(address)
      @message.addresses.push(address)
    end
    respond_to do |format|
      format.html
      format.js {
        @addresses = Address.search(search_params["0"][:name])
      }
    end
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    binding.pry
    @message = Message.new(message_params)
    @message.from = "5034868936"
    binding.pry
    @address = Address.find_or_initialize_by(message_params[:addresses_attributes]["0"])
    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:to, :body, addresses_attributes: [:id, :name, :number, :_destroy ])
    end
    def search_params
      params.require(:message).require(:addresses_attributes)
    end
end
