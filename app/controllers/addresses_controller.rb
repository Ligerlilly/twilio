class AddressesController < ApplicationController
  before_action :find_address, except: [:new, :index, :create]

  def index
    if params[:search]
      @address = Address.find_by_name(params[:search])
    end
    @addresses = Address.all

    respond_to do |format|
      format.html
      format.json { render json: {number: @address.number, id: @address.id}}
    end
  end

  private
  def find_address
    @address = Address.find(params[:id])
  end
end
