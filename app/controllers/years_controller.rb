class YearsController < ApplicationController
  before_action :set_year, only: %i[ show edit update destroy ]

  # GET /years or /years.json
  def index
    @years = Year.where(user_id: current_user.id)
    @year_scores = []
    @years.each do |year|
      total_score = 0
      total_credits = helpers.get_total_year_credits(year)
      modules = helpers.get_year_modules(year)
      modules.each do |m|
        score = helpers.get_module_score(m)
        total_score += score * (m.credits / total_credits)
      end
      @year_scores.push(total_score)
    end
  end

  # GET /years/1 or /years/1.json
  def show
    @modules = helpers.get_year_modules(@year)
    @total_score = 0
    total_credits = helpers.get_total_year_credits(@year)
    modules = helpers.get_year_modules(@year)
    modules.each do |m|
      score = helpers.get_module_score(m)
      @total_score += score * (m.credits / total_credits)
    end
  end

  # GET /years/new
  def new
    @year = Year.new
  end

  # GET /years/1/edit
  def edit
  end

  # POST /years or /years.json
  def create
    @year = Year.new(year_params)

    respond_to do |format|
      if @year.save
        format.html { redirect_to year_url(@year), notice: "Year was successfully created." }
        format.json { render :show, status: :created, location: @year }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /years/1 or /years/1.json
  def update
    respond_to do |format|
      if @year.update(year_params)
        format.html { redirect_to year_url(@year), notice: "Year was successfully updated." }
        format.json { render :show, status: :ok, location: @year }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /years/1 or /years/1.json
  def destroy
    @year.destroy!

    respond_to do |format|
      format.html { redirect_to years_url, notice: "Year was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def year_params
      params.require(:year).permit(:year_number, :user_id)
    end
end
