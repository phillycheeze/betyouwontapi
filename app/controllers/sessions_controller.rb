class SessionsController < ApplicationController
  before_action :authenticate, only: :destroy

  def create
    user = Manager.find_by_email(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      render json: user
    else
      render json: {error: "Login credentials are invalid"},
        status: :unauthorized
    end
  end

  def destroy
    @current_user.regenerate_auth_token
    if @current_user.save
      head :no_content
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end
end
