class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  
  def index 
    @users = User.join_customers

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = Use.new(user_params)

    if @user.save
      render :show, status: :created, location: @user 
    else
      render json: @user.errors, status: :unprocessable_entity 
    end
  
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content 
  end


  private
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:full_name,:phone_number, :email)
    end
end
