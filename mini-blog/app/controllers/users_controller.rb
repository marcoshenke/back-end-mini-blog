class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  # GET /users
  def index
    users = Users::List.new(params).execute

    render json: users, meta: pagination(users), each_serializer: UserSerializer, status: :ok
  end

  # GET /users/1
  def show
    render json: @user, serializer: UserSerializer, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :username)
  end
end
