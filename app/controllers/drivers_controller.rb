class DriversController < ApplicationController
  before_action :authenticate, except: :token

  def create
    if m = @current_user.drivers.create(create_params)
      render json: m
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

  def token
    if d = Driver.find_by(token: params[:token])
      render json: { driver: { name: d.name } }
    else
      head :no_content
    end
  end

  def create_params
    params.require(:driver).permit(:name)
  end
end
