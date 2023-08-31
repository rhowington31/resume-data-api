class UsersController < ApplicationController
  before_action :authenticate_user, only: [:destroy]
  before_action :set_user, only: [:destroy]

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def destroy
    if current_user == @user
      @user = @user.destroy
      render json: { message: "User successfully deleted." }
    else
      render json: { error: "You are not authorized to delete this user account." }
    end
  end
end
