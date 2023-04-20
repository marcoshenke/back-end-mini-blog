class KindUsersController < ApplicationController
  before_action :set_kind_user, only: %i[ show edit update destroy ]

  # GET /kind_users
  def index
    @kind_users = KindUser.all
  end

  # GET /kind_users/1
  def show
  end

  # GET /kind_users/new
  def new
    @kind_user = KindUser.new
  end

  # GET /kind_users/1/edit
  def edit
  end

  # POST /kind_users
  def create
    @kind_user = KindUser.new(kind_user_params)

    if @kind_user.save
      redirect_to @kind_user, notice: "Kind user was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kind_users/1
  def update
    if @kind_user.update(kind_user_params)
      redirect_to @kind_user, notice: "Kind user was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /kind_users/1
  def destroy
    @kind_user.destroy
    redirect_to kind_users_url, notice: "Kind user was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind_user
      @kind_user = KindUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_user_params
      params.fetch(:kind_user, {})
    end
end
