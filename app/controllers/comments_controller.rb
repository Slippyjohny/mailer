class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: [:destroy]

  def new
    @event=Event.find(parms[:event])
    @comment=@event.comments.build
  end

  def create
    @event=Event.find(params[:event_id])
    @comment=@event.comments.build(comment_params)
    @comment.user_id=current_user.id
    respond_to do |format|
      if @comment.save

        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to @event, alert: 'Comment cant be blank.'}
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
