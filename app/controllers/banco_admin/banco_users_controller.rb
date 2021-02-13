class BancoAdmin::BancoUsersController < ApplicationController
  layout "banco_admin_application"
  skip_before_action  :check_cliente_logged
  before_action :set_banco_user, only: %i[ show edit update destroy ]

  # GET /banco_users or /banco_users.json
  def index
    @banco_users = BancoUser.all
  end

  # GET /banco_users/1 or /banco_users/1.json
  def show
  end

  # GET /banco_users/new
  def new
    @banco_user = BancoUser.new
  end

  # GET /banco_users/1/edit
  def edit
  end

  # POST /banco_users or /banco_users.json
  def create
    @banco_user = BancoUser.new(banco_user_params)

    respond_to do |format|
      if @banco_user.save
        format.html { redirect_to [:banco_admin, @banco_user] , notice: "Banco user was successfully created." }
        format.json { render :show, status: :created, location: @banco_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @banco_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banco_users/1 or /banco_users/1.json
  def update
    respond_to do |format|
      if @banco_user.update(banco_user_params)
        format.html { redirect_to banco_admin_banco_users_path, notice: "Banco user was successfully updated." }
        format.json { render :show, status: :ok, location: @banco_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @banco_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banco_users/1 or /banco_users/1.json
  def destroy
    @banco_user.destroy
    respond_to do |format|
      format.html { redirect_to banco_admin_banco_users_path, notice: "Banco user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco_user
      @banco_user = BancoUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def banco_user_params
      params.require(:banco_user).permit(:nome, :email, :senha, :banco_id)
    end
end
