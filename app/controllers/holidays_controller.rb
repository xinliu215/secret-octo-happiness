class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]

  # GET /holidays
  # GET /holidays.json
  def index
    @holidays = Holiday.all
    @calender_dates = CalenderDate.all
    @countries = Country.all   

    if params[:set_country] && params[:set_year]
      ct = params[:set_country]
      yr = params[:set_year]
      dt = DateTime.new(yr.to_i)
      boy = dt.beginning_of_year.to_date
      eoy = dt.end_of_year.to_date
      calender = CalenderDate.where("calender_date >= ? and calender_date <= ?", boy, eoy).all
      @holiday_date = HolidayDate.where("country_id = ? and calender_date_id >= ? and calender_date_id <= ?", ct.to_i, calender.first.id, calender.last.id)
    else
      #@holiday_date = HolidayDate.find_by_sql("select * " +
      #                                        "FROM holiday_dates h " + 
      #                                        "LEFT JOIN calender_dates c " +
      #                                        "ON h.country_id = 2 " +
      #                                        "and extract(year from c.calender_date) = 2015 " +
      #                                        "and c.id = h.calender_date_id")
      dt = DateTime.new(2015)
      boy = dt.beginning_of_year.to_date
      eoy = dt.end_of_year.to_date
      calender = CalenderDate.where("calender_date >= ? and calender_date <= ?", boy, eoy).all
      @holiday_date = HolidayDate.where("country_id = 2 and calender_date_id >= ? and calender_date_id <= ?", calender.first.id, calender.last.id)
        
    end
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
    
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to @holiday, notice: 'Holiday was successfully created.' }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to holidays_url, notice: 'Holiday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holiday_params
      params[:holiday]
    end
end
