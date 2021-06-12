class Chat < ApplicationRecord
  after_create { broadcast_append_to "chats" }
end
