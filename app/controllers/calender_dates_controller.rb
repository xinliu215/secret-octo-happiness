class CalenderDatesController < ApplicationController
  before_action :set_calender_date, only: [:show, :edit, :update, :destroy]

  # GET /calender_dates
  # GET /calender_dates.json
  def index
    @calender_dates = CalenderDate.all
  end

  # GET /calender_dates/1
  # GET /calender_dates/1.json
  def show
  end

  # GET /calender_dates/new
  def new
    @calender_date = CalenderDate.new
  end

  # GET /calender_dates/1/edit
  def edit
  end

  # POST /calender_dates
  # POST /calender_dates.json
  def create
    @calender_date = CalenderDate.new(calender_date_params)

    respond_to do |format|
      if @calender_date.save
        format.html { redirect_to @calender_date, notice: 'Calender date was successfully created.' }
        format.json { render :show, status: :created, location: @calender_date }
      else
        format.html { render :new }
        format.json { render json: @calender_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calender_dates/1
  # PATCH/PUT /calender_dates/1.json
  def update
    respond_to do |format|
      if @calender_date.update(calender_date_params)
        format.html { redirect_to @calender_date, notice: 'Calender date was successfully updated.' }
        format.json { render :show, status: :ok, location: @calender_date }
      else
        format.html { render :edit }
        format.json { render json: @calender_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calender_dates/1
  # DELETE /calender_dates/1.json
  def destroy
    @calender_date.destroy
    respond_to do |format|
      format.html { redirect_to calender_dates_url, notice: 'Calender date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calender_date
      @calender_date = CalenderDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calender_date_params
      params[:calender_date]
    end
end
