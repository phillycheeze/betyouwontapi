class ReadingsController < ApplicationController
  def create
  end

  def index
  end

  def show
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
