class InvitesController < ApplicationController
  load_and_authorize_resource
  def new
    @event=Event.find(params[:event_id])
    @invite = @event.invites.build
  end


  def create
    @event=Event.find(params[:event_id])
    @invite = @event.invites.build(invite_params)
    @invite.sender_id = current_user.id

    respond_to do |format|
      if @invite.save
        if @invite.recipient_id != nil

          InviteMailer.existing_user_invite(@invite, event_url(@event,invite_token: @invite.token )).deliver
        else
          InviteMailer.new_user_invite(@invite, new_user_registration_url(invite_token: @invite.token)).deliver
        end
        format.html { redirect_to :back, notice: 'Invite was successfully sent.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to @event, alert: 'Invalid email'}
      end
    end
  end



  private

  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:token, :email)
  end
end
