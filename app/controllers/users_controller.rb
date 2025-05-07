class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_user, only: %i[ edit update ]
  before_action :require_same_user, only: %i[ edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(params.expect(user: [ :name, :email, :password, :password_confirmation, :time_zone ]))

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to new_pet_path, notice: "Welcome to Pet Trackers App, #{@user.name.split(" ").map(&:capitalize).join(" ")}. You have signed up successfully." }
        format.json { render :show, status: :created, location: new_pet_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!
    session[:user_id] = nil if @user == current_user

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, alert: "#{@user.name} and all associated records were successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :name, :email, :password ])
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own account...."
        redirect_to @user
      end
    end
end
