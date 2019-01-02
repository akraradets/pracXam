class PapersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paper, only: [:show, :edit, :update, :destroy, :getRate, :postRate, :getFeedback, :postFeedback]
  before_action :set_options, only: [:index, :new, :edit, :update, :create]
  # GET /papers
  # GET /papers.json
  def index
    @subjects = Subject.where(nil) 
    @subjects = @subjects.id(params[:subject_id]) if params[:subject_id].present?
    @subjects = @subjects.id(true?(params[:cs_required])) if params[:cs_required].present?
    @subjects = @subjects.id(true?(params[:im_required])) if params[:im_required].present?
    # @papers = Paper.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @discussion = Discussion.new paper_id: params[:id]
    # @discussion_comment = DiscussionComment.new
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)
    @paper.user = current_user
    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit, status: :error}
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # All the AJAX
  # GET /papers/1/rate.json
  def getRate(currentRate = nil)
    @info = {}
    @info['rates'] = @paper.count_difficulty()
    if currentRate.nil? == false
      # Do not need to check
      @info['currentRate'] = currentRate
    else
      # Need to check
      @feedback = current_user.paper_difficulties.where('paper_id=?',@paper.id).first
      if @feedback.nil?
        @info['currentRate'] = -1
      else
        @info['currentRate'] = @feedback.rate
      end
    end
    render json: @info
  end
  # POST /paper/1/rate.json
  def postRate
    @currentRate = -1
    if params['rate']
      if @paper.difficulties.where('rater_id=?',current_user.id).any?
        @paper.difficulties.where('rater_id=?',current_user.id).destroy_all
      end
      @dif = PaperDifficulty.create(paper_id: @paper.id, rate:params['rate'], rater_id:current_user.id)
      @currentRate = params['rate'].to_i
    end
    self.getRate @currentRate
  end

  # GET /papers/1/feedback.json
  def getFeedback(userLike = nil)
    @info = {}
    @info['likes'] = @paper.count_feedback()
    if userLike.nil? == false
      # Do not need to check
      @info['userLike'] = userLike
    else
      # Need to check
      @feedback = current_user.paper_feedbacks.where('paper_id=?',@paper.id).first
      if @feedback.nil?
        @info['userLike'] = -1
      else
        @info['userLike'] = @feedback.feedback
      end
    end
    render json: @info
  end

  # POST /papers/1/feedback.json
  def postFeedback
    @userLike = -1
    if params['like']
      if @paper.feedbacks.where('provider_id=?',current_user.id).any?
        @like = @paper.feedbacks.where('provider_id=?',current_user.id).first
        if @like.feedback == params['like'].to_i
          @like.destroy
        else
          @like.update(feedback: params['like'])
          @userLike = params['like'].to_i
        end
      else
        @like = PaperFeedback.create(paper_id: @paper.id, feedback: params['like'], provider_id: current_user.id)
        @userLike = params['like'].to_i
      end
    end
    self.getFeedback @userLike
  end

  private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:year, :month, :annual, :prof_name, :duration, :open_book, :open_network, :user_id, :subject_id, :document)
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def set_options
      @semesters = ['January','August','Inter-Sem']
      @annuals = ['Midterm','Final']
      @cs_requireds = [['Yes',true],['No',false]]
      @im_requireds = [['Yes',true],['No',false]]
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
