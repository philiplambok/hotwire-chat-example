class ChatsController < ApplicationController
  def create
    Chat.create!(chat_params)
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
    end
  end

  def show
    @chat = Chat.find params[:id]
  end

  def edit
    @chat = Chat.find params[:id]
  end

  def update
    chat = Chat.find params[:id]
    chat.update!(chat_params)
    respond_to do |format|
      format.html do
        render partial: 'chats/chat', locals: { chat: chat }
      end
    end
  end

  def destroy
    chat = Chat.find params[:id]
    chat.destroy!
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end