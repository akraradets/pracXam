class DiscussionCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion_comment, only: [:show, :edit, :update, :destroy]

  # GET /discussion_comments
  # GET /discussion_comments.json
  def index
    @discussion_comments = DiscussionComment.all
  end

  # GET /discussion_comments/1
  # GET /discussion_comments/1.json
  def show
  end

  # GET /discussion_comments/new
  def new
    @discussion_comment = DiscussionComment.new
  end

  # GET /discussion_comments/1/edit
  def edit
  end

  # POST /discussion_comments
  # POST /discussion_comments.json
  def create
    @discussion_comment = DiscussionComment.new(discussion_comment_params)
    @discussion_comment.user = current_user
    respond_to do |format|
      if @discussion_comment.save
        format.html { redirect_to @discussion_comment.discussion.paper, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @discussion_comment }
      else
        format.html { render :new }
        format.json { render json: @discussion_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussion_comments/1
  # PATCH/PUT /discussion_comments/1.json
  def update
    respond_to do |format|
      if @discussion_comment.is_owner?(current_user) && @discussion_comment.update(discussion_comment_params)
        format.html { redirect_to @discussion_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion_comment }
      else
        format.html { render :edit, status: :error }
        format.json { render json: @discussion_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussion_comments/1
  # DELETE /discussion_comments/1.json
  def destroy
    paper = @discussion_comment.discussion.paper
    @discussion_comment.destroy if @discussion_comment.is_owner?(current_user)
    respond_to do |format|
      if @discussion_comment.destroyed?
        format.html { redirect_to paper, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to paper, alert: 'You do not have permission to delete this comment' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion_comment
      @discussion_comment = DiscussionComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_comment_params
      params.require(:discussion_comment).permit(:user_id, :discussion_id, :content)
    end
end
