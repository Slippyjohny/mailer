class RegistrationsController < Devise::RegistrationsController
  before_action :set_token


  def after_sign_up_path_for(resource)
    if @token != nil
     puts  invite = Invite.find_by_token(@token)
      if invite !=nil
        invite.recipient_id=current_user.id
        AttachedEventsUser.create(user_id: current_user.id, event_id: invite.event.id)
        invite.save
      end
    end
    root_path
  end


  protected
  def set_token
    @token = params[:invite_token]
  end
end
