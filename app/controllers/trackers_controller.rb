class TrackersController < ApplicationController
  before_action :set_pet
  before_action :set_tracker, only: %i[ show edit update destroy ]
  before_action :require_user, except: %i[ show edit update destroy ]

  # GET /trackers or /trackers.json
  def index
    @trackers = @pet.trackers.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.csv
    end
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
    @tracker.brand = @tracker.brand.downcase!
    @tracker.description = @tracker.description.downcase!
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
    @tracker.update!(params.expect(tracker: [:amount, :left_amount, :hungry_extend, :time_of_eat_back_and_forth, :love_extend, :favorite_score]))
    @tracker.total_ate_amount = @tracker.amount - @tracker.left_amount
    @tracker.transformed_time = @tracker.date.strftime('%Y-%m-%d')
    @tracker.frequency = @tracker.time_of_eat_back_and_forth.split(', ').count
    @tracker.love_extend = love_choose
    @tracker.favorite_score = calculate_love_score + freq_score

    respond_to do |format|
      if @tracker.update(params.expect(tracker: [ :pet_id, :date, :feeding_time, :time_of_eat_back_and_forth, :food_type, :brand, :description, :amount, :left_amount, :hungry_extend, :result, :weight, :total_ate_amount, :note ]))
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
      params.expect(tracker: [ :pet_id, :date, :feeding_time, :time_of_eat_back_and_forth, :food_type, :brand, :description, :amount, :favorite_score, :note, :hungry_extend, :result, :weight ])
    end

    def love_choose
      if @tracker.love_extend == "Love it So Much"
        "heart.png"
      elsif @tracker.love_extend == "So so"
        "triangle.png"
      elsif @tracker.love_extend == "Not Like it"
        "x.png"
      end
    end

    def calculate_love_score
      if @tracker.love_extend == "heart.png"
        10
      elsif @tracker.love_extend == "triangle.png"
        5
      elsif @tracker.love_extend == "x.png"
        1
      end
    end

    def freq_score
      if @tracker.frequency > 2
        (@tracker.frequency - 2) * 2 + 2
      elsif @tracker.frequency <= 2
        @tracker.frequency * 1
      else
        0
      end
    end
end
