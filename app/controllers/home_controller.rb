class HomeController < ApplicationController
  def index
    @chats = Chat.all
    @new_chat = Chat.new
  end
end
