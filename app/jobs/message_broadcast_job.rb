class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.event_id}_channel",
                                 message: render_message(message)
  end

  private
  def render_message(message)
   CommentsController.render partial: 'messages/comment', locals: {message: message}
  end
end