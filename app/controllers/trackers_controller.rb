class TrackersController < ApplicationController
  before_action :set_tracker, only: %i[ show edit update destroy ]

  # GET /trackers or /trackers.json
  def index
    @trackers = Tracker.all
  end

  # GET /trackers/1 or /trackers/1.json
  def show
  end

  # GET /trackers/new
  def new
    @tracker = Tracker.new
  end

  # GET /trackers/1/edit
  def edit
  end

  # POST /trackers or /trackers.json
  def create
    @tracker = Tracker.new(tracker_params)
    @tracker.pet = current_pet
    # @tracker.total_ate_amount = @tracker.amount - @tracker.left_amount

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to @tracker, notice: "Tracker was successfully created." }
        format.json { render :show, status: :created, location: @tracker }
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
        format.html { redirect_to @tracker, notice: "Tracker was successfully updated." }
        format.json { render :show, status: :ok, location: @tracker }
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
      format.html { redirect_to trackers_path, status: :see_other, notice: "Tracker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker
      @tracker = Tracker.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tracker_params
      params.expect(tracker: [ :pet_id, :date, :feeding_time, :time_of_eat_back_and_forth, :type, :brand, :description, :amount, :left_amount, :favorite_score ])
    end
end
