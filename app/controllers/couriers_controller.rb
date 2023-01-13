class CouriersController < ApplicationController

  before_action :set_courier, only: [:show, :update, :destroy]
  
  def index 
    @couriers = Courier.all

    render json: @couriers
  end

  def show
    render json: @courier
  end

  def create
    @courier = Courier.new(courier_params)

    if @courier.save
      render :show, status: :created, location: @courier 
    else
      render json: @courier.errors, status: :unprocessable_entity 
    end
  
  end

  def update
    if @courier.update(courier_params)
      render :show, status: :ok, location: @courier
    else
      render json: @courier.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @courier = Courier.find(params[:id])
    @courier.destroy

    head :no_content 
  end

  private
    def set_courier
      @courier = Courier.find(params[:id])
    end
  
    def courier_params
      params.require(:courier).permit(:full_name,:phone_number, :email)
    end
end
