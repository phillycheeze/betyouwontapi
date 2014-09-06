class ManagersController < ApplicationController
  def create
    if m = Manager.create(create_params)
      head :created
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
