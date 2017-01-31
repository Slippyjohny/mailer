class EventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "events_#{params['event_id']}_channel"
  end

  def unsubscribed

  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], event_id: data['event_id'])
  end
end