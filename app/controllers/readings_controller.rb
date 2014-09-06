class ReadingsController < ApplicationController
  before_action :authenticate, except: :create

  def create
    d = Driver.where(token: create_params[:token])
    if d
      create_params.delete(:token)
      if r = d.readings.create(create_params)
        render json: r
      else
        render json: r.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    d = Driver.where(token: params[:reading][:token])
    if d
      render json: d.readings
    end
  end

  def show
    d = Driver.where(token: params[:reading][:token])
    if d
      render json: d.readings.find(params[:id])
    end
  end

  def create_params
    params.require(:reading).permit(
      :name,
      :value,
      :timestamp,
      :token
    )
  end
end
