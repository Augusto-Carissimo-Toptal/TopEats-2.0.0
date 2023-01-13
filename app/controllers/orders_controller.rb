class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :update, :destroy]
  
  def index 
    @orders = Order.all

    render json: @orders
  end

  def show
    render json: @orders
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      render :show, status: :created, location: @order 
    else
      render json: @order.errors, status: :unprocessable_entity 
    end
  
  end

  def update
    if @order.update(order_params)
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    head :no_content 
  end


  private
    def set_order
      @order = Order.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:status, :total_price)
    end
end
