require 'telegram/bot'
Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        bot.api.send_message(chat_id: message.chat.id, text: event.description)
    end
  end
end