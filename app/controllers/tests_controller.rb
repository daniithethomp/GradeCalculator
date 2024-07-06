class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
    @course_module = CourseModule.find(@test.course_module_id)
  end

  # GET /tests/new
  def new
    @test = Test.new
    @module_id = params["module_id"]
    redirect_to :back if @module_id == nil
  end

  # GET /tests/1/edit
  def edit
    @course_module = CourseModule.find(@test.course_module_id)
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @course_module = CourseModule.find(@test.course_module_id)
    @test.destroy!

    respond_to do |format|
      format.html { redirect_to course_module_path(@course_module), notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:name, :course_module_id, :max_score, :earned_score, :is_threshold, :pass, :weight)
    end
end
