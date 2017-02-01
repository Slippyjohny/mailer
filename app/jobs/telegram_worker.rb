require 'telegram/bot'

class TelegramWorker
  include Sidekiq::Worker
  def perform event_id
    event=Event.find(event_id)
    token ='308738729:AAE8tJlWQFb-pRUQgh9qVrNxqzMkkb0a49A'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
          when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
            bot.api.send_message(chat_id: message.chat.id, text: "You have new invite#{event.description}")
          when '/start'

        end
      end
    end
  end
end