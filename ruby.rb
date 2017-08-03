require 'telegram/bot'
require './test.rb'
token = '438804914:AAG8VciXU5aRh9JeXYiOnO5ZCOnan6V7uco'

module Global

  class << self
    attr_accessor :searching_crab
  end

end

Global.searching_crab = 'menu'

Telegram::Bot::Client.run(token, logger: Logger.new($stderr)) do |bot|
  bot.logger.info('Bot has been started')
  bot.listen do |message|
    buttons = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Make an order', callback_data: 'order'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Booking', callback_data: 'booking'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Feedback', callback_data: 'feedback')
    ]
    Structure.crab_master(message, bot)

  end

end

