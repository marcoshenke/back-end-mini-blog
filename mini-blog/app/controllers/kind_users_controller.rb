class KindUsersController < ApplicationController
  before_action :set_kind_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # POST /kind_users
  def create
    @kind_user = KindUser.new(kind_user_params)

    if @kind_user.save
      render json: @kind_user,
             notice: 'Kind user was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kind_users/1
  def update
    if @kind_user.update(kind_user_params)
      redirect_to @kind_user, notice: 'Kind user was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /kind_users/1
  def destroy
    @kind_user.destroy
    redirect_to kind_users_url, notice: 'Kind user was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kind_user
    @kind_user = KindUser.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kind_user_params
    params.require(:kind_user).permit(:kind)
  end
end
