class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :set_options, only: [:index]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all.order(code: :asc)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: "Subject [#{@subject.display}] was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjects_path, notice: "Subject [#{@subject.display}] was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :error}
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      if @subject.destroyed?
        format.html { redirect_to subjects_url, notice: "Subject [#{@subject.display}] was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to subjects_url, alert: @subject.errors.full_messages.first }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:code, :name, :cs_required, :im_required)
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def set_options
      @semesters = ['January','August','Inter-Sem']
      @annuals = ['Midterm','Final']
      @years = []
      Paper.select(:year).distinct.order(year: :desc).each do |row|
        @years.append(row.year)
      end

      @subject_options = []
      Subject.all.order(code: :asc).each do |row|
        option = ["#{row.code} - #{row.name}",row.id]
        @subject_options.append(option)
      end
    end
end
