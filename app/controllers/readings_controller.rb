class ReadingsController < ApplicationController
  before_action :authenticate, except: :create

  def create
    if d = Driver.find_by(token: params[:reading][:token])
      p d
      if r = d.readings.create(create_params)
        render json: r
      else
        render json: r.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    if d = Driver.find_by(token: params[:reading][:token])
      render json: d.readings
    end
  end

  def show
    if d = Driver.find_by(token: params[:reading][:token])
      render json: d.readings.find(params[:id])
    end
  end

  def create_params
    params.require(:reading).permit(
      :name,
      :value,
      :timestamp
    )
  end
end
