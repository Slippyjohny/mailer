class DocumentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_document, only: [:destroy]
  def show
    @document=Document.find(params[:id])
    send_file @document.attachment.path
  end
  def new
    @event = Event.find(params[:event_id])
    @document=@event.documents.build
  end

  def create
    @event = Event.find(params[:event_id])
    @document=@event.documents.build(document_params)
    @document.user_id=current_user.id
    respond_to do |format|
      if @document.save
        format.html { redirect_to @event, notice: 'Document was successfully attached.' }

      else
        format.html { redirect_to @event, alert: 'You did not attach the document.'}
      end
    end
  end
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
    end


  private
  def set_document
    @document=Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :attachment)
  end
end
