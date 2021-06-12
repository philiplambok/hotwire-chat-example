class Chat < ApplicationRecord
  after_create :append_chat_dom
  after_destroy_commit :remove_chat_dom

  private
  
  def append_chat_dom
    if Chat.all.size.eql?(1)
      broadcast_replace_to "chats", target: 'chats', 
                                    partial: 'chats/chats', 
                                    locals: { chats: Chat.all }
    else
      broadcast_append_to "chats"
    end
  end

  def remove_chat_dom
    if Chat.all.blank?
      broadcast_replace_to "chats", target: 'chats', 
                                    partial: 'chats/chats', 
                                    locals: { chats: Chat.all }
    else
      broadcast_remove_to 'chats'
    end
  end
end
