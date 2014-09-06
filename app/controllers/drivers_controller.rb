class DriversController < ApplicationController
  before_action :authenticate

  def create
    if m = @current_user.drivers.create(create_params)
      head :created
    else
      render json: m.errors, status: :unprocessable_entity
    end
  end

  def destroy
    m = @current_user.drivers.find(params[:id])
    m.destroy
    head :no_content
  end

  def index
    render json: @current_user.drivers.all
  end

  def show
    render json: @current_user.drivers.find(params[:id])
  end

  def create_params
    params.require(:driver).permit(
      :name
    )
  end
end
