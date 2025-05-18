class TrackersController < ApplicationController
  before_action :set_pet
  before_action :set_tracker, only: %i[ show edit update destroy ]
  before_action :require_user, except: %i[ show edit update destroy ]

  # GET /trackers or /trackers.json
  def index
    @trackers = @pet.trackers
    # @trackers = Tracker.all
  end

  # GET /trackers/1 or /trackers/1.json
  def show
  end

  # GET /trackers/new
  def new
    @tracker = @pet.trackers.build
    # @tracker = Tracker.new
  end

  # GET /trackers/1/edit
  def edit
  end

  # POST /trackers or /trackers.json
  def create
    @tracker = @pet.trackers.build(tracker_params)
    # @tracker = Tracker.new(tracker_params)

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to pet_trackers_path, notice: "Tracker was successfully created." }
        format.json { render :show, status: :created, location: pet_trackers_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/1 or /trackers/1.json
  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to pet_trackers_path, notice: "Tracker was successfully updated." }
        format.json { render :show, status: :ok, location: pet_trackers_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1 or /trackers/1.json
  def destroy
    @tracker.destroy!

    respond_to do |format|
      format.html { redirect_to [@pet, :trackers], status: :see_other, notice: "Tracker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end
    
    def set_tracker
      @tracker = @pet.trackers.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tracker_params
      params.expect(tracker: [ :pet_id, :date, :feeding_time, :time_of_eat_back_and_forth, :food_type, :brand, :description, :amount, :left_amount, :favorite_score, :note, :hungry_extend, :result, :weight ])
    end
end
