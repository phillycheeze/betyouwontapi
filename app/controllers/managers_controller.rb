class ManagersController < ApplicationController
  def create
    if m = Manager.create(create_params)
      render json: m
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def create_params
    params.require(:manager).permit(
      :email,
      :full_name,
      :password,
      :password_confirmation
    )
  end
end
