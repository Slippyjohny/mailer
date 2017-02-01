class NotificationsController < ApplicationController
  def show
    notification = Notification.find(params[:id])
    event=Event.find(notification.event_id)
    AttachedEventsUser.create(user_id: current_user.id, event_id: event.id)
    redirect_url = params[:redirect_url]
    if notification.delete && redirect_url.present?
      redirect_to redirect_url
    end
  end
  def index
    @notifications = current_user.notifications
  end
end
