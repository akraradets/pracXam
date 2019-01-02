class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.user = current_user
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion.paper, notice: 'Discussion was successfully created.' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { redirect_to @discussion.paper, alert: @discussion.errors }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.is_owner?(current_user) && @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit, status: :error }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    paper = @discussion.paper
    @discussion.destroy if @discussion.is_owner?(current_user)
    respond_to do |format|
      if @discussion.destroyed?
        format.html { redirect_to paper, notice: 'Discussion was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to paper, alert: 'You do not have permission to delete this discussion' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      # begin
        @discussion = Discussion.find(params[:id])
      # rescue => exception
      #   @discussion = Discussion.new        
      # end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:user_id, :paper_id, :content)
    end
end
