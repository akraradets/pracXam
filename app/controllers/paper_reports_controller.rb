class PaperReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paper_report, only: [:show, :edit, :update, :destroy]

  # GET /paper_reports
  # GET /paper_reports.json
  def index
    @paper_reports = PaperReport.all
  end

  # GET /paper_reports/1
  # GET /paper_reports/1.json
  def show
  end

  # GET /paper_reports/new
  def new
    @paper_report = PaperReport.new
  end

  # GET /paper_reports/1/edit
  def edit
  end

  # POST /paper_reports
  # POST /paper_reports.json
  def create
    @paper_report = PaperReport.new(paper_report_params)

    respond_to do |format|
      if @paper_report.save
        format.html { redirect_to @paper_report, notice: 'Paper report was successfully created.' }
        format.json { render :show, status: :created, location: @paper_report }
      else
        format.html { render :new }
        format.json { render json: @paper_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paper_reports/1
  # PATCH/PUT /paper_reports/1.json
  def update
    respond_to do |format|
      if @paper_report.update(paper_report_params)
        format.html { redirect_to @paper_report, notice: 'Paper report was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper_report }
      else
        format.html { render :edit, status: :error }
        format.json { render json: @paper_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_reports/1
  # DELETE /paper_reports/1.json
  def destroy
    @paper_report.destroy
    respond_to do |format|
      format.html { redirect_to paper_reports_url, notice: 'Paper report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper_report
      @paper_report = PaperReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_report_params
      params.require(:paper_report).permit(:paper_id, :report, :reporter_id)
    end
end
