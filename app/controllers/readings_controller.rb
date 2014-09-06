class ReadingsController < ApplicationController

  def create
    if d = Driver.find_by(token: params[:reading][:token])
      if r = d.readings.create(create_params)
        render json: r
      else
        render json: r.errors, status: :unprocessable_entity
      end
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
