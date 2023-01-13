class AddressesController < ApplicationController

  before_action :set_address, only: [:show, :update, :destroy]
  
  def index 
    @addresss = Address.all

    render json: @addresss
  end

  def show
    render json: @address
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      render :show, status: :created, location: @address 
    else
      render json: @address.errors, status: :unprocessable_entity 
    end
  
  end

  def update
    if @address.update(address_params)
      render :show, status: :ok, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    head :no_content 
  end


  private
    def set_address
      @address = Address.find(params[:id])
    end
  
    def address_params
      params.require(:address).permit(:address_field)
    end
end
