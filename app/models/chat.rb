class Chat < ApplicationRecord
  after_create { broadcast_append_to 'chats' }
  after_destroy { broadcast_remove_to 'chats' }
end
